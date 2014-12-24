describe 'the login process' do
  it 'signs in a user who uses correct email and password', js: true do
    visit '/#/login'
    FactoryGirl.create(:user)
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    save_and_open_page    
    click_button 'Log In'
    expect(page).to have_content 'Logged in as User 1'
  end
end