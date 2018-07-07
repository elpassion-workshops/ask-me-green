require 'rails_helper'

RSpec.describe 'Logged user creates new question' do
  scenario 'Ask new question link' do
    visit root_path
    click_link 'Log in'
    FactoryBot.create(:user)
    fill_in 'Email', with: 'example@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    expect(page).to have_content 'Ask question'

    expect(current_path).to eq ask_question_path
  end
end