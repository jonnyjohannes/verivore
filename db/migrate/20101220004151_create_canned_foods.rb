class CreateCannedFoods < ActiveRecord::Migration
  def self.up
    create_table :canned_foods do |t|
      t.string :name
      t.text :quantity
      t.text :quality
      t.text :procedure
      t.string :pack_style
      t.string :jar_size
      t.integer :process_time_1
      t.integer :process_time_2
      t.integer :process_time_3
      t.integer :process_time_4
      t.integer :process_pressure
      t.string :permalink
      
      t.timestamps
    end
  end

  def self.down
    drop_table :canned_foods
  end
end
