class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.integer :user_id
      t.integer :eve_character_id
      t.integer :reference_id
      t.string :reference_type
      t.string :contents

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
