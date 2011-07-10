class ModifyPackStyleProcessingTimeForCannedFoods < ActiveRecord::Migration
  def self.up
    rename_column :canned_foods, :process_time_1, :process_pressure_dial_2000
    rename_column :canned_foods, :process_time_2, :process_pressure_dial_4000
    rename_column :canned_foods, :process_time_3, :process_pressure_dial_6000
    rename_column :canned_foods, :process_time_4, :process_pressure_dial_8000
    rename_column :canned_foods, :process_pressure, :process_time_pint
    add_column :canned_foods, :process_time_quart, :integer
    add_column :canned_foods, :process_pressure_weighted_below_1000, :integer
    add_column :canned_foods, :process_pressure_weighted_above_1000, :integer
    remove_column :canned_foods, :pack_style
    remove_column :canned_foods, :jar_size
  end

  def self.down
    rename_column :canned_foods, :process_pressure_dial_2000, :process_time_1
    rename_column :canned_foods, :process_pressure_dial_4000, :process_time_2 
    rename_column :canned_foods, :process_pressure_dial_6000, :process_time_3
    rename_column :canned_foods, :process_pressure_dial_8000, :process_time_4 
    rename_column :canned_foods, :process_time_pint, :process_pressure
    remove_column :canned_foods, :process_time_quart
    remove_column :canned_foods, :process_pressure_weighted_below_1000
    remove_column :canned_foods, :process_pressure_weighted_above_1000
    add_column :canned_foods, :pack_style, :string
    add_column :canned_foods, :jar_size, :string
  end                                                         
end
