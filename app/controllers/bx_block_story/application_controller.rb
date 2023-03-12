module BxBlockStory
  class ApplicationController < BuilderBase::ApplicationController
    # include JSONAPI::Deserialization
    include BuilderJsonWebToken::JsonWebTokenValidation
    include ActiveStorage::Blob::Analyzable
    
    before_action :validate_json_web_token

    rescue_from ActiveRecord::RecordNotFound, :with => :not_found

    private

    def not_found
      render json: { 'errors' => ['Record not found'] }, status: :not_found
    end

    def format_activerecord_errors(errors)
      [{ error: errors.full_messages.first }]
    end

    def app_t(key)
      BxBlockLanguageOptions::ApplicationMessage.translation_message(key)
    end

    # def update_current_user
    #   current_user.update(last_visit_at: Time.now) if current_user.present?
    # end
  end
end
