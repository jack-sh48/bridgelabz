class BxBlockLandingpage::Scholarship < ApplicationRecord
    validates :email, presence: true, on: :create
end
