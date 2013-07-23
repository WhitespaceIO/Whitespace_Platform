class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :text

      t.timestamps
    end
  end
end
