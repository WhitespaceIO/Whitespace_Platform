class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :name
      t.string :description
      t.integer :ordinal

      t.timestamps
    end
  end
end
