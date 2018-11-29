class EventController < ApplicationController

  get '/events' do
    redirect_if_not_logged_in
    @events = Event.all
    erb :'/events/index'
  end

  get '/events/new' do
    redirect_if_not_logged_in
    @groups = Group.all
    erb :'events/new'
  end

  post '/events' do
    @user = current_user

    if params[:event].any?{|k,v| v == ""}
      redirect to 'events/new'
    else
      @event = Event.create(
        name: params[:event][:name],
        user_id: @user.id,
        description: params[:event][:description],
        date: params[:event][:date].to_date,
        start_time: params[:event][:start].to_time,
        end_time: params[:event][:end].to_time
        )

      params[:event][:group_ids].each do |id|
        @event.groups << Group.find(id)
      end
    end
    redirect :"events/#{@event.id}"
  end

  get '/events/:id' do
    redirect_if_not_logged_in
    @event = Event.find(params[:id])
    erb :'/events/show'
  end

  get '/events/:id/edit' do
    redirect_if_not_logged_in
    @event = Event.find(params[:id])
    @groups = Group.all

    if @event.user_id != current_user.id
      redirect to '/events'
    end
    binding.pry
    erb :'/events/edit'
  end

  patch '/events/:id' do
    @event = Event.find(params[:id])

    @event.update(
      name: params[:event][:name],
      description: params[:event][:description],
      date: params[:event][:date].to_date,
      start_time: params[:event][:start].to_time,
      end_time: params[:event][:end].to_time
      )

    @event.groups.clear

    params[:event][:group_ids].each do |id|
      @event.groups << Group.find(id)
    end
    redirect to "events/#{@event.id}"
  end

  delete '/events/:id' do
    Event.find(params[:id]).delete
    redirect to '/users'
  end

end
