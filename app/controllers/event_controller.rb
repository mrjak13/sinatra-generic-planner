class EventController < ApplicationController

  get '/events' do
    erb :'/events/index'
  end

  get '/events/new' do
    erb :'events/new'
  end

  post '/events' do
    raise params.inspect
    # binding.pry
    if logged_in?
      @user = current_user
    elsif params.any?{|k,v| v == ""}
      redirect to 'events/new'
    else
      # binding.pry
      @event = Event.create(
        name: params[:name],
        user_id: @user.id,
        description: params[:description],
        date: params[:date].to_date,
        start_time: params[:start].to_time,
        end_time: params[:end].to_time
        )
    end

    erb :'events/show'
  end

end
