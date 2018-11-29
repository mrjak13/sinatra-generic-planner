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
      session[:user_id] = @user.id
    end
    redirect to "/users/#{current_user.id}"
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/users/#{current_user.id}"
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end

end
