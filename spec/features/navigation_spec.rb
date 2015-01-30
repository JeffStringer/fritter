describe 'navigation links rerouting' do
  it 'reroutes user to login path upon clicking login link', js: true do
    visit '/'
    click_link 'Log In'
    expect(page).to have_button 'Log In'
  end

  it 'reroutes user to signup path upon clicking signup link', js: true do
    visit '/'
    click_link 'Sign Up'
    expect(page).to have_button 'Register'
  end

  it 'reroutes user to main path upon clicking home link', js: true do
    visit '/#/login'
    click_link 'Fritter'
    expect(current_path).to eq '/'
  end
end