describe 'new message' do

  before do
    visit '/#/login'
    FactoryGirl.create(:user)
    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log In'
  end

  it 'displays message content on page after user successful submission', js: true do
    fill_in "What's happening?", with: 'Hear ye hear ye!'
    click_button 'Submit'
    expect(page).to have_content 'Hear ye hear ye!'
  end

  it 'displays message content on page after user successful submission', js: true do
    fill_in "What's happening?", with: ''
    click_button 'Submit'
    expect(page).to have_content "message can't be blank"
  end

  it 'displays message content on page after user successful submission', js: true do
    fill_in "What's happening?", with: 'Sed ut perspiciatis unde omnis iste natus error 
    sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae 
    ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.'
    click_button 'Submit'
    expect(page).to have_content "message is too long (maximum is 140 characters)"
  end
end