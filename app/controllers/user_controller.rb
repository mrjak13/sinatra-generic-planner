class UserController < ApplicationController

  get '/users' do
    erb :'/users/index'
  end

end
