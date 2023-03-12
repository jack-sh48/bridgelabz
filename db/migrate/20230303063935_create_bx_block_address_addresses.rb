class CreateBxBlockAddressAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :bx_block_address_addresses do |t|
      t.integer :pin_code
      t.string :address
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
