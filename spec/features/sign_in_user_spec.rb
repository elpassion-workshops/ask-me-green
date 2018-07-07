require 'rails_helper'

RSpec.describe 'Logging to existing account' do
  scenario 'User logins into account' do
    visit root_path
    click_link 'Log in'
    click_button 'Log in'

    FactoryBot.create(:user)

    expect(page).to have_content 'Invalid Email or password.'
    expect(current_path).not_to eq root_path

    fill_in 'Email', with: 'example@gmail.com'
    fill_in 'Password', with: '123456'

    click_button 'Log in'
    expect(current_path).to eq root_path
    expect(page).to have_content 'Signed in successfully'
  end
end