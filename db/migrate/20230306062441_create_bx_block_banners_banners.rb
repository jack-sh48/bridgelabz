class CreateBxBlockBannersBanners < ActiveRecord::Migration[6.0]
  def change
    create_table :bx_block_banners_banners do |t|
      t.string :alignment
      t.string :border
      t.string :border_colour
      t.float :border_width
      t.string :background_colour
      t.string :background_image
      t.string :position
      t.string :banner_title
      t.text :banner_description
      t.string :submit_button_text
      t.float :border_redius
      t.string :logo_image

      t.timestamps
    end
  end
end
