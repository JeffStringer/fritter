describe 'follow process' do
  
  before do
    FactoryGirl.create(:user)
    FactoryGirl.create(:user2)
  end

  it "displays followed user's messages", js: true do
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
    click_button 'Follow'
    save_and_open_page
    expect(page).to have_content 'Hear ye hear ye!'
  end
end