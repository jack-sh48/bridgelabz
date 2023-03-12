class BxBlockBanners::Banner < ApplicationRecord
  has_one_attached :logo_image
  has_one_attached :background_image
  validates :banner_title, presence: true, on: :create
end
