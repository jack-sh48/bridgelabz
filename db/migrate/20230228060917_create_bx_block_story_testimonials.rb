class CreateBxBlockStoryTestimonials < ActiveRecord::Migration[6.0]
  def change
    create_table :bx_block_story_testimonials do |t|
      t.string :name
      t.string :company_name
      t.string :position
      t.string :content
      t.string :video_url
      t.string :link
      t.string :description
      t.integer :account_id, foreign_key: true, null: false
      t.integer :company_id, foreign_key: true, null: false
      t.timestamps
    end
  end
end
