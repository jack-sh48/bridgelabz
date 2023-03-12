class CreateBxBlockLandingpageScholarships < ActiveRecord::Migration[6.0]
  def change
    create_table :bx_block_landingpage_scholarships do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :qualification
      t.integer :passout_year
      t.integer :mobile, :limit => 8
      t.integer :experience
      t.string :work_area

      t.timestamps
    end
  end
end
