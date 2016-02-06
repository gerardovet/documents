require 'sequel'

Sequel.connect(ENV['DATABASE_URL'])

DB.create_table? :documents do
  primary_key :id
  String      :title
  String      :tags
  String      :description
end
