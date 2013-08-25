class Post < ActiveRecord::Base
  attr_accessible :body, :title, :tag_list

  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :title
  validates_presence_of :body

  def tag_list=(tags)
    array_of_tags = tags.split(' ')
    array_of_tags.each do |tag|
      newtag = Tag.find_or_create_by_name(tag)
      newtag.posts << self
    end
  end

  def taggings
    @tags = self.tags
    string = ''
    @tags.each {|tag| string << tag.name + ","}
    string = string.chop
  end

  
end
