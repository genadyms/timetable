require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, 'sqlite3:timetable.db'

class Client < ActiveRecord::Base
  validates :name, presence: true
  validates :role, presence: true
end

class Week < ActiveRecord::Base
end

before do
  @clients = Client.all
end

get '/' do
  @c = Client.new
  erb :index
end

post '/' do
  @c = Client.new params[:client]
  if !@c.save
    @error = "Error"
  end
  erb :index
end