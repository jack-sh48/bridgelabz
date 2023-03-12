class CreateBxBlockTeamsTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :bx_block_teams_teams do |t|
      t.string :name
      t.string :position
      t.text :description
      t.string :linkedin_url
      t.integer :experience
      t.string :image
      t.string :designation

      t.timestamps
    end
  end
end
