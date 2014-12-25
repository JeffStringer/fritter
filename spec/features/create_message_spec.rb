describe 'new message' do
  it 'displays message content on page after user submission', js: true do
    visit '/#/login'
    FactoryGirl.create(:user)
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log In'
    fill_in "What's happening?", with: 'Hear ye hear ye!'
    click_button 'Submit'
    expect(page).to have_content 'Hear ye hear ye!'
  end
end