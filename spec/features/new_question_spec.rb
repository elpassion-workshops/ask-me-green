require 'rails_helper'

RSpec.describe 'Logged user creates new question' do
  scenario 'Ask new question link' do
    visit root_path
    click_link 'Log in'
    FactoryBot.create(:user)
    fill_in 'Email', with: 'example@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    click_link 'Ask question'

    fill_in 'Title', with: 'Test title'
    fill_in 'Content', with: 'Test content'

    click_button 'Create Question'

    expect(page).to have_content 'Question successfully created'
  end

  scenario 'Unsigned user can\'t ask a question' do
    visit new_question_path

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end