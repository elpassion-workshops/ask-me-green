require 'rails_helper'

RSpec.describe 'Logged user creates new question' do
  scenario 'User can add tag to the question' do
    visit root_path
    click_link 'Log in'
    FactoryBot.create(:user)
    fill_in 'Email', with: 'example@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    click_link 'Ask question'

    fill_in 'Title', with: 'Test title'
    fill_in 'Content', with: 'Test content'
    fill_in 'Tags', with: 'What'

    click_button 'Create Question'

    expect(page).to have_content 'Question successfully created'
    expect(page).to have_content 'What'

  end
end