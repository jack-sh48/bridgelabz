module BxBlockStory
  class Story < ApplicationRecord
    self.table_name = 'bx_block_story_stories'
    belongs_to :company, class_name: 'BxBlockStory::Company'
    belongs_to :testimonial, class_name: 'BxBlockStory::Testimonial'
    belongs_to :account, class_name: 'AccountBlock::Account'
    validates :testimonial_id, uniqueness: true
    validates :position, presence: true
    has_one_attached :image
  end 
end