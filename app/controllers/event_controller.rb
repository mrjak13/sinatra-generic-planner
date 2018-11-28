class EventController < ApplicationController

  get '/events' do
    erb :'/events/index'
  end

  get '/events/new' do
    erb :'events/new'
  end

  post '/events' do

    if logged_in?
      @user = current_user
    end

    if params.any?{|k,v| v == ""}
      redirect to 'events/new'
    else
      @event = Event.create(
        name: params[:name],
        user_id: @user.id,
        description: params[:description],
        date: params[:date].to_date,
        start_time: params[:start].to_time.hour,
        end_time: params[:end].to_time.hour
        )
    end
    redirect :"events/show/#{@event.id}"
  end

  get '/events/show/:id' do
    @event = Event.find(params[:id])
    erb :'/events/show'
  end

end
