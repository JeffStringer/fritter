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
end