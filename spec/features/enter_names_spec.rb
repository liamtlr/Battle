require 'spec_helper'

feature 'Enter names' do
  it 'allows players to enter their names' do
    visit('/')
    fill_in :player_1_name, with: "Bob"
    fill_in :player_2_name, with: "Larry"
    click_button 'Submit'
    #sign_in_and_play
    expect(page).to have_content ("Bob")
  end
end
