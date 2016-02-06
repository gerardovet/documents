require 'sinatra'
require './lib/document'
require 'sequel'
Tilt.register Tilt::ERBTemplate, 'html.erb'

DB = Sequel.sqlite('documents.db')

DB.create_table :items do
  primary_key :id
  String      :title
  String      :tags
  String      :description
end

get '/' do
  erb :new_document
end

get '/documents' do
  @documents = []
  4.times do
    @documents  << Document.new({
      title: 'Titulo',
      tags: 'Tag1, Tag2',
      description: 'Descripcion'
    })
  end
  erb :documents
end

post '/create_document' do
  @document = Document.new params
  @document.save
  erb :document
end
