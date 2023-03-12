class CreateBxBlockFaqFaqs < ActiveRecord::Migration[6.0]
  def change
    create_table :bx_block_faq_faqs do |t|
      t.string :description
      t.string :question
      t.string :content

      t.timestamps
    end
  end
end
