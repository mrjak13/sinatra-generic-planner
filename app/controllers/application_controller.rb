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
      flash[:message] = "Email already in use"
      redirect to '/login'
    else
      @user = User.create(name: params[:name], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
    end
    flash[:message] = "Thank you for signing up, start by creating a new event!"
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
      flash[:message] = "Invalid email or password"
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

  def current_user_is_admin?
    User.find_by(email: "admin@admin.com") == current_user ? true : false
  end

  def redirect_if_not_admin
    if !current_user_is_admin?
      flash[:errors] = "Action not authorized"
      redirect to '/users'
    end
  end

end
