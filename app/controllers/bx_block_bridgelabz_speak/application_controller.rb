module BxBlockBridgelabzSpeak
  class ApplicationController < BuilderBase::ApplicationController
    include ActiveStorage::Blob::Analyzable
    # include JSONAPI::Deserialization
    include BuilderJsonWebToken::JsonWebTokenValidation

    before_action :validate_json_web_token

    rescue_from ActiveRecord::RecordNotFound, :with => :not_found

    private

    def not_found
      render json: { 'errors' => ['Record not found'] }, status: :not_found
    end

    def serialization_options
      { params: { host: request.protocol + request.host_with_port } }
    end
    
    def format_activerecord_errors(errors)
      [{ error: errors.full_messages.first }]
    end

    def app_t(key)
      BxBlockLanguageOptions::ApplicationMessage.translation_message(key)
    end

    def update_current_user
      current_user.update(last_visit_at: Time.now) if current_user.present?
    end
  end
end
