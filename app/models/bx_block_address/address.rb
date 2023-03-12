class BxBlockAddress::Address < ApplicationRecord
  validates :pin_code, presence: true, on: :create
end
