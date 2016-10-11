require 'spec_helper'

feature 'view hit points' do
  it "allows player 1 to see her/his opponent's HP score" do
    visit('/')
    fill_in :player_1_name, with: "Bob"
    fill_in :player_2_name, with: "Larry"
    click_button 'Submit'
    # sign_in_and_play
    expect(page).to have_content ("Larry has 100 HP")
  end
end
