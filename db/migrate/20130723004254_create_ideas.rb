class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :text
      t.belongs_to :user
      t.belongs_to :phase
      t.timestamps
    end
  end
end
