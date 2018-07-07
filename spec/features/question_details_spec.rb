require 'rails_helper'

RSpec.describe 'Question details' do
  let!(:question){ create(:question, title: 'Test title', content: 'Test content') }
  scenario 'Any user can see details of question' do
    visit root_path
    click_link 'Questions'

    click_link 'Test title'

    expect(page).to have_content 'Test title'

    # will pass if we inside question
    expect(page).to have_content 'Test content'
  end
end