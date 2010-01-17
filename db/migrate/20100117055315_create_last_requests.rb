class CreateLastRequests < ActiveRecord::Migration
  def self.up
    create_table :last_requests do |t|
      t.integer :account_id
      t.string :url
      t.string :options

      t.timestamps
    end
  end

  def self.down
    drop_table :last_requests
  end
end
