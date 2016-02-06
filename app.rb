require 'sinatra'
require './lib/document'
require './config'
Tilt.register Tilt::ERBTemplate, 'html.erb'

get '/' do
  erb :new_document
end

get '/documents' do
  @documents = Document.all
  erb :documents
end

get '/documents/:id' do
  @document = Document.find({id: params[:id]})
  erb :document
end

post '/create_document' do
  @document = Document.new params
  @document.save
  erb :document
end
