require_relative 'welpers'
require 'spec_helper'

feature 'attack player 2' do
  scenario "attacks the other player" do
    sign_in_and_play
    click_button 'ATTACK!'
    expect(page).to have_content ("Ow! You laid the smackdown on Larry!")
  end
end
