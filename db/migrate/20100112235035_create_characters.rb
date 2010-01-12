class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters do |t|
      t.integer :user_id
      t.integer :character_id
      t.string :name
      t.integer :corporation_id
      t.string :corporation_name

      t.timestamps
    end
  end

  def self.down
    drop_table :characters
  end
end
