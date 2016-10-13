require 'spec_helper'

feature 'Player turn' do

  scenario 'displays  player 1 for first attack' do
    sign_in_and_play
    expect(page).to have_content 'Snuggles turn'
  end

  scenario 'see which player\'s turn ' do
    attack_and_switch
    expect(page).to have_content 'Amaal turn'
  end
end
