class CreateBxBlockFormsForms < ActiveRecord::Migration[6.0]
  def change
    create_table :bx_block_forms_forms do |t|
      t.string :image
      t.string :page_title
      t.text :page_description
      t.string :submit_button_text
      t.string :field_name
      t.text :field_description
      t.string :field_type
      t.string :background_colour
      t.string :border_redius
      t.float :border_width
      t.string :border_colour
      t.string :border
      t.string :alignment

      t.timestamps
    end
  end
end
