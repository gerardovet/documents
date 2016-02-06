require 'sequel'

DB = Sequel.sqlite('documents.db')

DB.create_table? :documents do
  primary_key :id
  String      :title
  String      :tags
  String      :description
end
