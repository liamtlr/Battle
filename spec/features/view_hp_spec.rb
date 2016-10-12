require_relative 'welpers'
require 'spec_helper'

feature 'view hit points' do
  scenario "shows player 1's HP score" do
    sign_in_and_play
    expect(page).to have_content ("Bob HP: 100")
  end
  scenario "shows player 2's HP score" do
    sign_in_and_play
    expect(page).to have_content ("Larry HP: 100")
  end
end
