class Document
  attr_accessor :id, :title, :tags, :description

  def initialize(params={})
    @id = params[:id]
    @title = params[:title]
    @tags = params[:tags]
    @description = params[:description]
  end

  def self.all
    DB[:documents].all.map do |row|
      Document.new row
    end
  end

  def self.find(params={})
    Document.new DB[:documents].where(id: params[:id]).first
  end

  def save
    DB[:documents].insert(title: @title, tags: @tags, description: @description)
  end
end
