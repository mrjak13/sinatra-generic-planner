class EventController < ApplicationController

  get '/events' do
    erb :'/events/index'
  end

  get '/events/new' do
    @groups = Group.all
    erb :'events/new'
  end

  post '/events' do

    if logged_in?
      @user = current_user
    end

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
    @event = Event.find(params[:id])
    erb :'/events/show'
  end

end
