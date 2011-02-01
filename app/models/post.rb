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
	has_many :comments, :order => "created_at DESC"
	has_permalink :title, :update => true
	
  cattr_reader :per_page
  @@per_page = 5
  
  def to_param
    "#{id}-#{permalink}"
  end
  
  def short_body
    wordcount = 50
    body.split[0..(wordcount-1)].join(" ") + (body.split.size > wordcount ? " ... " : "")
  end
    
end

