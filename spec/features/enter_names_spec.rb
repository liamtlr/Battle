require_relative 'welpers'
require 'spec_helper'

feature 'Enter names' do
  scenario 'allows players to enter their names' do
    sign_in_and_play
    expect(page).to have_content ("Bob")
  end
end
