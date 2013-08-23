class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :text
      t.belongs_to :user
      t.belongs_to :phase
      t.timestamps
    end
  end
end
