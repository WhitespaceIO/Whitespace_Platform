class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.text :description
      t.string :url
      t.string :type
      t.belongs_to :user
      t.timestamps
    end

    create_table :ideas_resources, :id => false do |t|
      t.references :idea
      t.references :resource
    end

    add_index :resources, :user_id
  end
end
