require 'rubygems'
require 'sinatra/base'

require 'haml'
require 'sass'

require 'beer'
require 'auth'

module BeerCatalogue

  class Application < Sinatra::Base

    enable :sessions, :logging, :static
    
    include BeerCatalogue::Authentication

    before '/login' do
      skip_authentication
    end

    before '/styles.css' do
      skip_authentication
    end

    before do
      require_authentication
    end

    get '/' do
      haml :index
    end

    get '/login' do
      haml :login
    end

    post '/login' do
      authenticate(params[:username], params[:password]) && redirect('/') || haml(:login)
    end

    get '/logout' do
      logout
      redirect '/login'
    end

    get '/styles.css' do
      scss :styles
    end
    

  end
end


