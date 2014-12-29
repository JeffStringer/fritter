describe 'message form visibility' do

  it 'is not visible when guest visits site', js: true do
    visit '/'
    expect(page).to_not have_button 'Submit'
  end

  it 'is visible when user logs in', js: true do
    visit '/#/login'
    FactoryGirl.create(:user)
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log In'
    expect(page).to have_button 'Submit'
  end
end