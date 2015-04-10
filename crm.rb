require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'
require "sinatra/reloader" if development?

$rolodex = Rolodex.new

get '/' do
  @title = "ACRM"
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
  erb :add_contact
end

get '/contacts/:id' do
  @id = params['id'].to_i
  @contact = $rolodex.find(@id)
  if @contact
    erb :contact
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id/edit' do
  @id = params['id'].to_i
  @contact = $rolodex.find(@id)
  if @contact
    erb :edit
  else
    raise Sinatra::NotFound
  end
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:notes])
  $rolodex.add_contact(new_contact)
  redirect to('/contacts')
end

put '/contacts/:id' do
  @id = params['id'].to_i
  @contact = $rolodex.find(@id)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.notes = params[:notes]
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

delete '/contacts/:id' do
  @id = params['id'].to_i
  @contact = $rolodex.find(@id)
  if @contact
    $rolodex.delete_contact(@contact)
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end
