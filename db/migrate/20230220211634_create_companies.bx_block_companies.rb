class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
    	t.string :company_name
    	t.string :subtitle
    	t.string :location
    	t.text :description
    	t.integer :account_id, foreign_key: true, null: false
    	t.timestamps
    end
  end
end
