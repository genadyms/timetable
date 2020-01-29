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
  @c = Client.new
end

get "/client/:id/edit" do
  erb "edit"
end

get "/client/:id/remove" do
  Client.destroy params[:id]
  erb :index
end

get '/' do
  erb :index
end

post '/' do
  @c = Client.new params[:client]
  if !@c.save
    @error = "Error"
  end
  erb :index
end