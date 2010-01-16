class CreateNotifications < ActiveRecord::Migration
  def self.up
    create_table :notifications do |t|
      t.integer :character_id
      t.integer :notification_type_id
      t.integer :sender_id
      t.datetime :send_date
      t.boolean :read

      t.timestamps
    end
  end

  def self.down
    drop_table :notifications
  end
end
