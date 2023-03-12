class CreateBxBlockExperientialLearningExperientials < ActiveRecord::Migration[6.0]
  def change
    create_table :bx_block_experiential_learning_experientials do |t|
      t.integer :hours_of_coding
      t.integer :weeks_online_program
      t.float :live_session
      t.string :experienced_industry_expert

      t.timestamps
    end
  end
end
