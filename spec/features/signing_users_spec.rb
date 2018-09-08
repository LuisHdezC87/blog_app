require 'rails_helper'

RSpec.feature "Users Sign in" do

  before do
    @user = User.create!(email: 'jhon@example.com', password: 'password')
  end

  scenario 'with valid credentials' do
    visit '/'
    click_link "Sign In"
    fill_in 'Email', with: @user.email
    fill_in 'Password',with: @user.password
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content("Signed in as #{@user.email}")
    expect(page).not_to have_link('Sign In')
    expect(page).not_to have_link('Sign Up')
  end

end  
