require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "sinatra_events_calander_app"
    register Sinatra::Flash
  end

  get "/" do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    if params.any?{|k,v| v == ""}
      redirect to '/signup'
    elsif User.find_by(email: params[:email])
      redirect to '/login'
    else
      @user = User.create(name: params[:name], email: params[:email], password: params[:password])
      @user.save
    end

  end

  get '/login' do
    erb :login
  end

end
