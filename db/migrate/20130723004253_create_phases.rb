class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :type
      t.datetime :started_at
      t.datetime :completed_at
      t.belongs_to :project
      t.timestamps
    end
  end
end
