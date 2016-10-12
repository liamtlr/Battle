require 'spec_helper'

feature 'Enter names' do
  scenario 'submitting names' do
    visit('/')
    fill_in :player_1_name, with: 'Frances'
    fill_in :player_2_name, with: 'Amaal'
    click_button 'Submit'
    expect(page).to have_content 'Frances vs. Amaal'
  end
end
