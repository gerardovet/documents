class Document
  attr_accessor :title, :tags, :description

  def initialize(params={})
    @title = params[:title]
    @tags = params[:tags].split(",")
    @description = params[:description]
  end

  def save
    DB.insert(title: @title, tags: @tags, description: @description)
  end
end
