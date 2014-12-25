describe 'the login process' do
  it 'reroutes logged in user to main path', js: true do
    visit '/#/login'
    FactoryGirl.create(:user)
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log In'
    expect(page).to have_content 'Logged in as User 1'
  end

  it 'signs in a user who uses correct email and password', js: true do
    visit '/#/login'
    FactoryGirl.create(:user)
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log In'
    expect(current_path).to eq '/'
  end
end