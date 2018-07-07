require 'rails_helper'


RSpec.describe 'Pagination for index' do
  FactoryBot.create_list(:question, 25)
  scenario 'User visits index' do
    visit questions_path
    expect(page).to have_content('question-box', count: 10)
  end
end