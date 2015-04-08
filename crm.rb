require_relative 'contact'
require 'sinatra'

get '/' do
  erb :index
end

get '/contacts' do
  erb :contacts
end

