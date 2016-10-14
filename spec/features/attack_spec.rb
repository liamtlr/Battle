require 'spec_helper'

feature 'Attacking' do
  scenario 'attack Player 2' do
    sign_in_and_play
    click_link 'Attack'
    expect(page).to have_content 'Snuggles attacked Amaal'
  end
  scenario 'reduce Player 2 HP by a random amount' do
    sign_in_and_play
    allow(Game.instance.non_current_player).to receive(:random_damage).and_return(10)
    click_link 'Attack'
    expect(page).not_to have_content 'Amaal: 60HP'
    expect(page).to have_content 'Amaal: 50HP'
  end
  scenario 'player can select from multiple types of attack' do
    sign_in_and_play
    expect(page).to have_content 'Paralyse'
  end
end
