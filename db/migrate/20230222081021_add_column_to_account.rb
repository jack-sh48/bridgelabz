class AddColumnToAccount < ActiveRecord::Migration[6.0]
  def change
  	add_column :accounts, :password, :string
  end
end
