class BxBlockForms::Form < ApplicationRecord
  has_one_attached :image
  validates :page_title, presence: true, on: :create
end
