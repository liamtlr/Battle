require 'sinatra/base'
require './lib/player'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  get '/play' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    @player_1_health = $player_1.health
    @player_2_health = $player_2.health
    erb(:play)
  end

  get '/aftermath' do
    @player_2_name = $player_2.name
    @player_2_health = $player_2.reduce_health
    erb(:aftermath)
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
