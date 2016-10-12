require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = params[:player_1_name]
    player_2 = params[:player_2_name]
    $game = Game.new(player1, player_2)
    redirect '/play'
  end

  get '/play' do
    @new_game = $game
    erb(:play)
  end

  get '/aftermath' do
    @new_game = $game
    @new_game.attack(@new_game.player_2)
    erb(:aftermath)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
