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
    redirect_if_logged_in
    erb :index
  end

  get '/signup' do
    redirect_if_logged_in
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
    flash[:message] = "Thank you for signing up, please enjoy!"
    redirect to '/users'
  end

  get '/login' do
    redirect_if_logged_in
    erb :login
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/users'
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    redirect_if_not_logged_in
    session.clear
    redirect to '/'
  end

  def current_user
    User.find(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def redirect_if_not_logged_in
    if !logged_in?
      flash[:errors] = "You must be logged in to view that page."
      redirect to '/'
    end
  end

  def redirect_if_logged_in
    if logged_in?
      flash[:errors] = "You must be logged out to view that page."
      redirect to '/users'
    end
  end

end
