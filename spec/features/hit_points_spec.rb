require 'spec_helper'

feature 'View hit points' do

  scenario 'see Player 2 hit points' do
    sign_in_and_play
    expect(page).to have_content 'Amaal: 60HP'
  end

  # scenario 'Player 2 hit points reduced after attack' do
  #   sign_in_and_play
  #   expect(page).to have_content 'Amaal: 50HP'
  # end
end
