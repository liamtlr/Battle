def sign_in_and_play
  visit('/')
  fill_in :player_1_name, with: 'Frances'
  fill_in :player_2_name, with: 'Amaal'
  click_button 'Submit'
end