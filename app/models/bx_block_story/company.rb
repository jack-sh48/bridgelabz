module BxBlockStory
  class Company < ApplicationRecord
    self.table_name = :companies
    has_many :testimonials, class_name: 'BxBlockStory::Testimonial'
    has_many :stories, class_name: 'BxBlockStory::Story'
    belongs_to :account, class_name: 'AccountBlock::Account'
    validates_uniqueness_of :company_name
    validates :description, presence: true
    has_one_attached :logo
    default_scope { order(created_at: :desc) }
  end
end
