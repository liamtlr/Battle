require_relative 'welpers'
require 'spec_helper'

feature 'view hit points' do
  scenario "allows player 1 to see her/his opponent's HP score" do
    sign_in_and_play
    expect(page).to have_content ("Larry HP: 100")
  end
end
