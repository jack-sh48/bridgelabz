module BxBlockBridgelabzSpeak
  class BridgelabzSpeak < ApplicationRecord
    self.table_name = 'bx_block_bridgelabz_speak_bridgelabz_speaks'
    belongs_to :account, class_name: 'AccountBlock::Account'
    validates :video, presence: true
    validates :title, presence: true
    has_one_attached :bridgelabz_speak_image
  end
end