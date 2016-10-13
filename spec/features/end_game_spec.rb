require 'spec_helper'

feature 'Game ends' do
  scenario 'player hp reaches 0' do
    sign_in_and_play
    10.times do
      click_link 'Attack'
      click_link 'Switch Turns'
    end
    click_link 'Attack'
    expect(page).to have_content 'Game Over'
  end
end
