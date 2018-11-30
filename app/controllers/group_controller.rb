class GroupController < ApplicationController

  get '/groups' do
    redirect_if_not_logged_in
    @groups = Group.all
    erb :'/groups/index'
  end

  get '/groups/new' do
    redirect_if_not_logged_in
    redirect_if_not_admin
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
    erb :'/groups/show'
  end

  get '/groups/:id/edit' do
    redirect_if_not_logged_in
    redirect_if_not_admin
    @group = Group.find(params[:id])
    erb :'/groups/edit'
  end

  patch '/groups/:id' do
    @group = Group.find(params[:id])
    @group.update(name: params[:name])
    redirect to '/groups'
  end

  delete '/groups/:id' do
    @group = Group.find(params[:id])
    @group.delete
    redirect to '/groups'
  end

end
