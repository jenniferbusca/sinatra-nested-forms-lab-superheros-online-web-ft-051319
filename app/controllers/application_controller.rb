require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :team
    end

    post '/teams' do
      @team = Team.new(params[:team])
      params[:team][:members].each {|member| Hero.new(member)}
      @heroes = Hero.all
      erb :super_hero
    end
end
