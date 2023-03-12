class BxBlockNewsAboutUs::NewsAbout < ApplicationRecord
    has_one_attached :image
    validates :title, presence: true, on: :create
    validates :sub_title, presence: true, on: :create
    validates :link, presence: true, on: :create
    validates :description, presence: true, on: :create
    validates :image, presence: true , on: :create
    validates :content, presence: true, on: :create
end
