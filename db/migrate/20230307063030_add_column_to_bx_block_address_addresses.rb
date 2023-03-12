class AddColumnToBxBlockAddressAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :bx_block_address_addresses, :lat, :decimal
    add_column :bx_block_address_addresses, :lng, :decimal
  end
end
