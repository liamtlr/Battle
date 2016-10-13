require_relative 'welpers'
require 'spec_helper'

feature 'Switching turns' do
  scenario 'after player 1 attacks' do
    sign_in_and_play
    click_button "ATTACK!"
    expect(page).to have_content ("Bob has attacked Larry")
  end
end
