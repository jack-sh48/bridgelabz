class RenameAndAddColumnsInContentVideos < ActiveRecord::Migration[6.0]
  def change
  	rename_column :content_videos, :headline, :name 
  	rename_column :content_videos, :separate_section, :url
  	add_column :content_videos, :account_id, :integer, foreign_key: true
  end
end
