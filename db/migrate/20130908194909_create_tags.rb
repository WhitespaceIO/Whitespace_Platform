class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.belongs_to :taggable, :polymorphic => true
      t.timestamps
    end

    add_index :tags, :name
    add_index :tags, [:taggable_id, :taggable_type]
  end

  def self.down
    drop_table :tags
  end
end
