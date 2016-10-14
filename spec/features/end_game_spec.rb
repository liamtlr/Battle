require 'spec_helper'

feature 'Game ends' do
  scenario 'player hp reaches 0' do
    sign_in_and_play
    allow(Game.instance.current_player).to receive(:random_damage).and_return(10)
    allow(Game.instance.non_current_player).to receive(:random_damage).and_return(10)
    10.times do
      click_link 'Attack'
      click_link 'Switch Turns'
    end
    click_link 'Attack'
    expect(page).to have_content 'Lose'
  end
end
