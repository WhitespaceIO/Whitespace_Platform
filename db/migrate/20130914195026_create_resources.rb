class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.string :url
      t.string :type
      t.belongs_to :user
      t.timestamps
    end

    create_table :phases_resources, :id => false do |t|
      t.references :phase
      t.references :resource
    end

    add_index :resources, :user_id
  end
end
