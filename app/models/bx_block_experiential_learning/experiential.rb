class BxBlockExperientialLearning::Experiential < ApplicationRecord
    validates :hours_of_coding, presence: true, on: :create
end
