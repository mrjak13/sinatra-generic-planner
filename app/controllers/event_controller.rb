class EventController < ApplicationController

  get '/events' do
    erb :'/events/index'
  end

end
