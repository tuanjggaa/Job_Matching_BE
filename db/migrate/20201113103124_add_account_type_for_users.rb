class AddAccountTypeForUsers < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :account_type, :integer, default: 0
  end
end
