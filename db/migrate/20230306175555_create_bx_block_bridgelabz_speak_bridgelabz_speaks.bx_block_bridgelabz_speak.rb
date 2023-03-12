class CreateBxBlockBridgelabzSpeakBridgelabzSpeaks < ActiveRecord::Migration[6.0]
  def change
    create_table :bx_block_bridgelabz_speak_bridgelabz_speaks do |t|
      t.string :title
      t.string :video 
      t.string :content
      t.text :description
      t.string :subtitle
      t.string :youtube_link
      t.string :website_link
      t.integer :account_id, foreign_key: true
      t.timestamps
    end
  end
end
