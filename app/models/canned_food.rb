# == Schema Information
#
# Table name: canned_foods
#                        
#  name             :string 
#  quantity         :text   
#  quality          :text   
#  procedure        :text   
#  pack_style       :string 
#  jar_size         :string 
#  process_time_1   :integer
#  process_time_2   :integer
#  process_time_3   :integer
#  process_time_4   :integer
#  process_pressure :integer
#  permalink        :string
#  created_at       :datetime
#  updated_at       :datetime
# 
 
class CannedFood < ActiveRecord::Base
  
  def self.search(search)
    if search 
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
