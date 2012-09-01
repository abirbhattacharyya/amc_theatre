class CreateTheatres < ActiveRecord::Migration
  def self.up
    create_table :theatres do |t|
      t.string :name
      t.integer :unit_number, :limit => 8
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.integer :zip, :limit => 8
      t.string :web_url
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end

  def self.down
    drop_table :theatres
  end
end
