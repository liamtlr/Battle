 require 'spec_helper'

 feature 'One player version of the game' do
   scenario 'only one player is specified when starting ou' do
     sign_in_and_lonely_play
     expect(page).to have_content 'Bob vs. the_computer'
   end
 end
