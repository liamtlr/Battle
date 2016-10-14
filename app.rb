require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  enable :sessions

  before do
    @game = Game.instance
  end

  get '/' do
    erb :index
  end

  post '/names' do
    player_2_name = params[:player_2_name].empty? ? :Computer : params[:player_2_name]
    player_1  = Player.new(params[:player_1_name])
    player_2  = Player.new(player_2_name)
    @game = Game.game_create(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    if @game.current_player.name == :Computer
      redirect '/attack'
    end
    erb :play
  end

  get '/attack' do
    @game.attack(@game.non_current_player)
    redirect '/end_game' if @game.end_game?
    erb :attack
  end

  get '/paralyse' do
    @game.paralyse(@game.non_current_player)
    erb :attack
  end

  get '/poison' do
    @game.poison_player(@game.non_current_player)
    erb :attack
  end

  get '/heal' do
    @game.heal
    erb :attack
  end

  get '/switch' do
    @game.switch_turn if @game.double_switch == true
    @game.switch_turn
    @game.reset_turn
    redirect '/play'
  end

  get '/end_game' do
    erb :end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
