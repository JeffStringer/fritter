describe 'the signup process' do

  before do
    visit '/#/signup'
  end
    
  it 'provides success if the user signs up properly', js: true do
    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Username', with: 'User 1'
    fill_in 'Handle', with: 'user1'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Register'
    expect(page).to have_content 'Logged in as User 1'
  end

  it 'provides error message if email is blank', js: true do
    fill_in 'Email', with: ''
    fill_in 'Username', with: 'User 1'
    fill_in 'Handle', with: 'user1'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Register'
    expect(page).to have_content 'Please enter your email.'
  end

  it 'provides error message if email is invalid', js: true do
    fill_in 'Email', with: 'user@'
    fill_in 'Username', with: 'User 1'
    fill_in 'Handle', with: 'user1'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Register'
    expect(page).to have_content 'Please enter a valid email.'
  end

  it 'provides error message if username is blank', js: true do
    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Username', with: ''
    fill_in 'Handle', with: 'user1'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Register'
    expect(page).to have_content 'Please enter your username.'
  end

  it 'provides error message if handle is blank', js: true do
    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Username', with: 'User 1'
    fill_in 'Handle', with: ''
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Register'
    expect(page).to have_content 'Please enter a handle.'
  end

  it 'provides error message if password is blank', js: true do
    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Username', with: 'User 1'
    fill_in 'Handle', with: 'user1'
    fill_in 'Password', with: ''
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Register'
    expect(page).to have_content 'Please enter a password.'
  end

  it 'provides error message if password confirmation is blank', js: true do
    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Username', with: 'User 1'
    fill_in 'Handle', with: 'user1'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: ''
    click_button 'Register'
    expect(page).to have_content 'Please enter password confirmation.'
  end

  it 'provides error message if password and confirmation do not match', js: true do
    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Username', with: 'User 1'
    fill_in 'Handle', with: 'user1'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'passwrd'
    click_button 'Register'
    expect(page).to have_content 'Password and confirmation do not match.'
  end

  it 'provides error message if email has been taken', js: true do
    FactoryGirl.create(:user)
    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Username', with: 'User 2'
    fill_in 'Handle', with: 'user2'
    fill_in 'Password', with: 'snapple'
    fill_in 'Password Confirmation', with: 'snapple'
    click_button 'Register'
    expect(page).to have_content 'Email has already been taken'
  end

  it 'provides error message if email has been taken', js: true do
    FactoryGirl.create(:user)
    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Username', with: 'User 1'
    fill_in 'Handle', with: 'user'
    fill_in 'Password', with: 'snapple'
    fill_in 'Password Confirmation', with: 'snapple'
    click_button 'Register'
    expect(page).to have_content 'Username has already been taken'
  end

  it 'provides error message if email has been taken', js: true do
    FactoryGirl.create(:user)
    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Username', with: 'User'
    fill_in 'Handle', with: 'user1'
    fill_in 'Password', with: 'snapple'
    fill_in 'Password Confirmation', with: 'snapple'
    click_button 'Register'
    expect(page).to have_content 'Handle has already been taken'
  end
end