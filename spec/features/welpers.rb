def sign_in_and_play
  visit('/')
  fill_in :player_1_name, with: "Bob"
  fill_in :player_2_name, with: "Larry"
  click_button 'Submit'
end

def laying_the_smackdown
  19.times do
    click_button 'ATTACK!'
    click_button 'OK'
  end
end
