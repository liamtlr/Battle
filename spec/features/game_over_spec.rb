require 'spec_helper'

feature 'GAME OVER!' do
  scenario "Game ends when a player's HP reaches 0" do
    sign_in_and_play
    laying_the_smackdown
    expect(page).to have_content 'Larry is FUBAR :('
  end
end
