require 'spec_helper'

feature 'attack player 2' do
  scenario "attacks the other player" do
    visit('/')
    fill_in :player_1_name, with: "Bob"
    fill_in :player_2_name, with: "Larry"
    click_button 'Submit'
    click_button 'ATTACK!'
    # sign_in_and_play
    expect(page).to have_content ("Ow! You laid the smackdown on Larry!")
  end
end
