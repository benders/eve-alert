class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :full_api_key

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
