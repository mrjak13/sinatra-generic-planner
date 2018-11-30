class GroupController < ApplicationController

  get '/groups' do
    redirect_if_not_logged_in
    @groups = Group.all
    erb :'/groups/index'
  end

  get '/groups/new' do
    redirect_if_not_logged_in
    erb :'/groups/new'
  end

  post '/groups' do
    if !Group.find_by(name: params[:name])
      Group.create(name: params[:name])
      redirect to '/groups'
    else
      flash[:message] = "That group already exists"
      redirect to '/groups'
    end
  end

  get '/groups/:id' do
    redirect_if_not_logged_in
    @group = Group.find(params[:id])
    erb :'groups/show'
  end

end
