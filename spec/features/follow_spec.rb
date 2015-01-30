describe 'follow process' do
  
  before do
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user2)
    @user.followers.create(follower_id: @user2.id)
    visit '/#/login'
    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log In'
    fill_in "What's happening?", with: 'Hear ye hear ye!'
    click_button 'Submit'
    click_link 'Log Out'
    visit '/#/login'
    fill_in 'Email', with: 'user2@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log In'
  end

  it "displays followed user's messages", js: true do
    expect(page).to have_content 'Hear ye hear ye!'
  end

  it "displays the total number of users the user is following", js: true do
    expect(page).to have_content 'Following: 1'
  end

  it "displays the total number of followers the user has", js: true do
    expect(page).to have_content 'Followers: 0'
  end

  it "should not give the option of following as no other users available", js: true do
    expect(page).to_not have_button 'Follow'
  end

  it 'should show users who are following current user', js: true do
    click_link 'Followers:'
    expect(page).to have_content 'User 2, you have no current followers.'
  end

  it 'should show who current user is following', js: true do
    click_link 'Following:'
    expect(page).to have_content 'User 2, you are following: User 1'
  end

  it 'should allow user to unfollow a followed user', js: true do
    click_link 'Following:'
    click_button 'Unfollow'
    save_and_open_page
    expect(page).to_not have_button 'Unfollow'
  end
end
