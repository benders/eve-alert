class AddErrorToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :error, :string
  end

  def self.down
    remove_column :accounts, :error
  end
end
