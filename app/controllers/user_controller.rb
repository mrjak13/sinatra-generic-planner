class UserController < ApplicationController

  get '/users' do
    redirect_if_not_logged_in
    @user = current_user
    erb :'/users/show'
  end
end
