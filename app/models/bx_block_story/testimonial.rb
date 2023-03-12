module BxBlockStory
  class Testimonial < ApplicationRecord
  	self.table_name = "bx_block_story_testimonials"
    belongs_to :account, class_name: 'AccountBlock::Account'
    belongs_to :company, class_name: 'BxBlockStory::Company'
    has_many :stories, through: :companies
    validates :company_name, presence: true
    default_scope { order(created_at: :desc) }
  end
end
