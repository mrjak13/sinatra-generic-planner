class UserController < ApplicationController

  get '/users/:id' do
    @user = current_user
    erb :'/users/show'
  end
end
