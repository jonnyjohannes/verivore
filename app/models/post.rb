# == Schema Information
#
# Table name: foods
#
#  id         :integer(11)      not null, primary key
#  title      :string(255)
#  body       :text
#  published  :tinyint(1)
#  permalink  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  validates_presence_of :body, :title 
	has_many :comments, :order => "created_at DESC", :dependent => :destroy
	has_many :taggings, :dependent => :destroy
	has_many :tags, :through => :taggings
	has_permalink :title, :update => true
	after_save :assign_tags
	attr_writer :tag_names
	
  cattr_reader :per_page
  @@per_page = 5
  
  def to_param
    "#{id}-#{permalink}"
  end
  
  def short_body
    wordcount = 50
    body.split[0..(wordcount-1)].join(" ") + (body.split.size > wordcount ? " ... " : "")
  end
  
  def tag_names
    @tag_names || tags.map(&:name).join(' ')
  end
  
  private
  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/\s+/).map do |name|
        Tag.find_or_create_by_name(name)
      end
    end
  end
  
end

