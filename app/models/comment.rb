# == Schema Information
#
# Table name: foods
#
#  id         :integer(11)      not null, primary key
#  post_id    :integer(11)
#  name       :string(255)
#  email      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
  validates_presence_of :name, :email, :body
  belongs_to :post
end
