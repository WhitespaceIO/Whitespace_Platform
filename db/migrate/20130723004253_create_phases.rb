class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :name
      t.string :description
      t.string :state
      t.integer :ordinal
      t.datetime :started_at
      t.datetime :completed_at
      t.belongs_to :project
      t.timestamps
    end
  end
end
