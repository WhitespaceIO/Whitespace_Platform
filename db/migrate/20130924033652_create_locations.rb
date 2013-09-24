class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.float :latitude
      t.float :longitude
      t.belongs_to :project
      t.timestamps
    end
  end
end
