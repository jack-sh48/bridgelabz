module AccountBlock
  class Account < AccountBlock::ApplicationRecord
    ActiveSupport.run_load_hooks(:account, self)
    self.table_name = :accounts

    include Wisper::Publisher

    has_secure_password
    before_validation :parse_full_phone_number
    # before_create :generate_api_key

    has_many :content_videos, class_name: 'BxBlockContentManagement::ContentVideo'
    has_many :stories, class_name: 'BxBlockStory::Story'
    has_many :companies, class_name: 'BxBlockStory::Company'
    has_many :testimonials, class_name: 'BxBlockStory::Testimonial'
    has_many :bridgelabz_speaks, class_name: 'BxBlockBridgelabzSpeak::BridgelabzSpeak'
    # has_many :companies, class_name: 'BxBlockStory::Company', dependent: :destroy

    # has_one :blacklist_user, class_name: "AccountBlock::BlackListUser", dependent: :destroy
    # after_save :set_black_listed_user
    # enum user_type: { user: 'user', admin: 'admin' }
    # enum status: %i[regular suspended deleted]
    
    validates :email, presence: true
    validates :password, presence: true
    # validates :password_confirmation, presence: true
    scope :active, -> { where(activated: true) }
    # scope :existing_accounts, -> { where(status: ["regular", "suspended"]) }

    private

    def parse_full_phone_number
      phone = Phonelib.parse(full_phone_number)
      self.full_phone_number = phone.sanitized
      self.country_code = phone.country_code
      self.phone_number = phone.raw_national
    end

    # def valid_phone_number
    #   unless Phonelib.valid?(full_phone_number)
    #     errors.add(:full_phone_number, "Invalid or Unrecognized Phone Number")
    #   end
    # end

    # def generate_api_key
    #   loop do
    #     @token = SecureRandom.base64.tr("+/=", "Qrt")
    #     break @token unless Account.exists?(unique_auth_id: @token)
    #   end
    #   self.unique_auth_id = @token
    # end

    # def set_black_listed_user
    #   if is_blacklisted_previously_changed?
    #     if is_blacklisted
    #       AccountBlock::BlackListUser.create(account_id: id)
    #     else
    #       blacklist_user.destroy
    #     end
    #   end
    # end
  end
end
