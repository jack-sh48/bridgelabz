module BxBlockStory
  class CompanySerializer < BuilderBase::BaseSerializer
    attributes :id, :company_name, :subtitle, :location, :account_id, :description, :created_at, :updated_at

    # attribute :logo do |object, params|
    #   host = params[:host] || ''
    #   if object&.logo.attached?
    #     url = host + Rails.application.routes.url_helpers.rails_blob_url(
    #         object&.logo, only_path: true )
    #   end
    # end

    attribute :logo do |object, params|
      host = params[:host] rescue ""
      if object&.logo.attached?
        url = if Rails.env.development? || Rails.env.test? || false
         host + Rails.application.routes.url_helpers.rails_blob_url(object&.logo, only_path: true )
        else
          object.logo.service_url.split("?").first
        end
      end
    end
  end
end
