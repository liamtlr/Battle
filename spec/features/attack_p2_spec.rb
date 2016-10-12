require_relative 'welpers'
require 'spec_helper'

feature 'attack player 2' do
  scenario "attacks the other player" do
    sign_in_and_play
    click_button 'ATTACK!'
    expect(page).to have_content ("Ow! You laid the smackdown on Larry!")
  end

  scenario "attacks player 2 and reduces hit points by 10" do
    sign_in_and_play
    click_button 'ATTACK!'
    expect(page).to have_content ("Larry HP: 90")
  end
end
