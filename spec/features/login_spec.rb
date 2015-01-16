describe 'the login process' do

  before do
    visit '/#/login'
    FactoryGirl.create(:user)
  end

  it 'reroutes logged in user to main path', js: true do
    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log In'
    expect(page).to have_content 'Logged in as User 1'
  end

  it 'signs in a user who uses correct email and password', js: true do
    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log In'
    expect(current_path).to eq '/'
  end

  it 'displays error message if email is blank', js: true do
    fill_in 'Email', with: ''
    fill_in 'Password', with: 'password'
    click_button 'Log In'
    expect(page).to have_content 'Please enter your email.'
  end

  it 'displays error message if email is invalid', js: true do
    fill_in 'Email', with: 'user@'
    fill_in 'Password', with: 'password'
    click_button 'Log In'
    expect(page).to have_content 'Please enter a valid email.'
  end

  it 'displays error message if email is invalid', js: true do
    fill_in 'Email', with: 'user@gmail'
    fill_in 'Password', with: ''
    click_button 'Log In'
    expect(page).to have_content 'Please enter your password.'
  end

  it 'displays error message if login fails', js: true do
    fill_in 'Email', with: 'user@gmail'
    fill_in 'Password', with: 'bubbles'
    click_button 'Log In'
    expect(page).to have_content 'Login failed: incorrect email and/or password'
  end
end