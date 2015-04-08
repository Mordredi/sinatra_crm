require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'

$rolodex = Rolodex.new

get '/' do
  @crm_app_name = "Arthur's CRM"
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
  puts @contact
  erb :contact
end

get '/contacts/edit/:id' do
  @id = params['id'].to_i
  @contact = $rolodex.find(@id)
  puts @contact
  erb :edit
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:notes])
  $rolodex.add_contact(new_contact)
  redirect to('/contacts')
end