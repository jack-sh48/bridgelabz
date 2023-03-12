module BxBlockNewsAboutUs
  class NewsAboutUsSerializer < BuilderBase::BaseSerializer

    attribute :news_data do |object, params|
      news_about_for(object, params)
    end

    private
    class << self
      def news_about_for(object, params)
        if object.image.attached?
          {id: object.id,title: object.title, sub_title: object.sub_title, image: params[:url]+ Rails.application.routes.url_helpers.rails_blob_path(object&.image, only_path: true), link: object.link, content: object.content, description: object.description}
        else
          {id: object.id,title: object.title, sub_title: object.sub_title, image: nil, link: object.link, content: object.content, description: object.description}
        end
      end
    end
  end
end
