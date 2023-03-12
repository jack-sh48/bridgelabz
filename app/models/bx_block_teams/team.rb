class BxBlockTeams::Team < ApplicationRecord
    has_one_attached :image
    validates :name, presence: true, on: :create
    validates :position, presence: true, on: :create
    validates :linkedin_url, presence: true, on: :create
    validates :description, presence: true, on: :create
    validates :image, presence: true , on: :create
    validates :experience, presence: true, on: :create
    validates :designation, presence: true, on: :create
end
