class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.integer :character_id
      t.string :event_type
      t.string :body

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
