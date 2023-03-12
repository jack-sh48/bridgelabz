class CreateBxBlockStoryStories < ActiveRecord::Migration[6.0]
  def change
    create_table :bx_block_story_stories do |t|
      t.string :name 
      t.string :position
      t.string :package
      t.string :description
      t.integer :account_id, foreign_key: true, null: false
      t.integer :company_id, foreign_key: true, null: false
      t.integer :testimonial_id, foreign_key: true, null: false
      t.timestamps
    end
  end
end
