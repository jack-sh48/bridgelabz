class BxBlockFaq::Faq < ApplicationRecord
    validates :question, presence: true, on: :create
    validates :description, presence: true, on: :create
end
