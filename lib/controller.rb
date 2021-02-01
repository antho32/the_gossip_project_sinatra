require 'bundler'
Bundler.require 
require_relative 'gossip'

class ApplicationController < Sinatra::Base
    get '/' do 
        erb :index, locals: {gossips: Gossip.all}
    end 
    get '/gossips/new/' do 
        erb :new_gossip
    end 

    post '/gossips/new/' do
        Gossip.new(params["gossip_author"], params["gossip_content"]).save
        redirect '/'
    end

    post'/gossips/:id/edit' do |id|
        #gossip = Gossip.find(params[:id])
        Gossip.new(params["gossip_author"],params["gossip_content"]).edit(id.to_i)
      redirect '/'
    end
end