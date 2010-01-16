class CreateMailMessages < ActiveRecord::Migration
  def self.up
    create_table :mail_messages do |t|
      t.integer :character_id
      t.integer :sender_id
      t.datetime :send_date
      t.string :title
      t.integer :to_corp_or_alliance_id
      t.string :to_character_ids
      t.string :to_list_ids
      t.boolean :read

      t.timestamps
    end
  end

  def self.down
    drop_table :mail_messages
  end
end
