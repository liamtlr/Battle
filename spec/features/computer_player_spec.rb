require 'spec_helper'

feature 'Computer player' do
  scenario 'computer takes turns' do
    sign_in_without_player_2
    switch
    expect(page).to have_content 'Computer attacked Snuggles'
  end

end
