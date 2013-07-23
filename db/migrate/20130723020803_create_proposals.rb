class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :text
      t.timestamps
      t.belongs_to :phase
    end
  end
end
