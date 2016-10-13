require 'spec_helper'

feature 'Game ends' do
  scenario 'player hp reaches 0' do
    10.times attack_and_switch
    expect(page).to have_content 'Game Over'
  end
end
