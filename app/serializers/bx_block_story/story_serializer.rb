module BxBlockStory
    class StorySerializer < BuilderBase::BaseSerializer
      attribute :id, :name, :position, :description, :package, :created_at, :updated_at

      attribute :image do |object, params|
          host = params[:host] rescue ""
          if object&.image.attached?
            url = if Rails.env.development? || Rails.env.test? || false
            host + Rails.application.routes.url_helpers.rails_blob_url(object&.image, only_path: true )
          else
            object.image.service_url.split("?").first
          end
        end
      end

      attribute :testimonial do | object |
        BxBlockStory::TestimonialSerializer.new(object&.testimonial)
      end

      attribute :company do | object, params |
        BxBlockStory::CompanySerializer.new(object&.company, { params: params } )
      end
    end
end