class CreateBxBlockNewsAboutUsNewsAbouts < ActiveRecord::Migration[6.0]
  def change
    create_table :bx_block_news_about_us_news_abouts do |t|
      t.string :title
      t.string :sub_title
      t.string :image
      t.string :link
      t.string :content
      t.string :description

      t.timestamps
    end
  end
end
