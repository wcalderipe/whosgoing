require 'byebug'
class EventsController < ApplicationController
  def index
    @event = Facebook::Fetcher.new(Facebook::Connection.new(), params[:fb_id]).load
  end
end
