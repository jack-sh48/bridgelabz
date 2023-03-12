module BxBlockBridgelabzSpeak
  class BridgelabzSpeakSerializer < BuilderBase::BaseSerializer
    attributes :id, :title, :video, :subtitle, :description, :youtube_link, :website_link, :created_at, :updated_at

    attribute :bridgelabz_speak_image do |object, params|
      host = params[:host] rescue ""
      if object&.bridgelabz_speak_image.attached?
        url = if Rails.env.development? || Rails.env.test? || false
         host + Rails.application.routes.url_helpers.rails_blob_url(object&.bridgelabz_speak_image, only_path: true )
        else
          object.bridgelabz_speak_image.service_url.split("?").first
        end
      end
    end
  end
end
