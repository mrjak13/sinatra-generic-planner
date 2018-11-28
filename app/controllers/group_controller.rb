class GroupController < ApplicationController

  get '/groups' do
    @groups = Group.all
    erb :'/groups/index'
  end

  get '/groups/new' do
    erb :'/grpups/new'
  end

  post '/groups' do
    if logged_in? && !Group.find_by(name: params[:name])
      Group.create(name: params[:name])
      redirect to '/events/new'
    else
      redirect to '/groups/new'
    end
  end

  get '/groups/:id' do
    @group = Group.find(params[:id])
    erb :'groups/show'
  end

end
