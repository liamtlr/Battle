require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  enable :sessions

  before { @new_game = Game.instance }

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    Game.create(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    erb(:play)
  end

  get '/aftermath' do
    if @new_game.current_turn == @new_game.player_1
      @new_game.attack(@new_game.player_2)
    else
      @new_game.attack(@new_game.player_1)
    end
    erb(:aftermath)
  end

  get '/game_over' do
    erb(:game_over)
  end

  post '/game_status' do
    @new_game.game_over? ? redirect('/game_over') : redirect('/switch_turns')
  end

  get '/switch_turns' do
    @new_game.switch_turns
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
