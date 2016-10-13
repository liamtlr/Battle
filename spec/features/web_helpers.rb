def sign_in_and_play
  visit('/')
  fill_in :player_1_name, with: 'Snuggles'
  fill_in :player_2_name, with: 'Amaal'
  click_button 'Submit'
end

def attack_and_switch
  sign_in_and_play
  click_link 'Attack'
  click_link 'Switch Turns'
end
