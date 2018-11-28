class UserController < ApplicationController

  get '/users' do
    @user = current_user
    erb :'/users/index'
  end

  get '/users/:id' do
    @user = current_user
    erb :'/users/show'
  end
end
