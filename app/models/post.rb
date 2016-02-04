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
	has_many :comments, -> { order(created_at: :desc) }, dependent: :destroy
	has_many :taggings, dependent: :destroy
	has_many :tags, through: :taggings
  extend FriendlyId
  friendly_id :title, use: :slugged
	
	has_attached_file :image, :styles => { :small => "150x150>", :large => "600x600>" }, 
	                  :url => "/assets/posts/:id/:style/:basename.:extension", 
	                  :path => ":rails_root/public/assets/posts/:id/:style/:basename.:extension"
	                  
	validates_attachment_size :image, :less_than => 5.megabytes
	validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
	
	after_save :assign_tags
	attr_writer :tag_names
  attr_accessor :image_file_name
  attr_accessor :image_content_type
  attr_accessor :image_file_size
  attr_accessor :image_updated_at
	
  cattr_reader :per_page
  @@per_page = 5
  
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

