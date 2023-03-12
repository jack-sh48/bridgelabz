module BxBlockBanners
  class BannerSerializer < BuilderBase::BaseSerializer

    attribute :banner_data do |object, params|
      banner_for(object, params)
    end

    private
    class << self
      def banner_for(object, params)
        if object.logo_image.attached? && object.background_image.attached?
          { id: object.id, banner_title: object.banner_title, banner_description: object.banner_description, submit_button_text: object.submit_button_text , background_colour: object.background_colour , border_redius: object.border_redius, border_width:  object.border_width, border_colour: object.border_colour, border: object.border, alignment: object.alignment, logo_image: params[:url]+ Rails.application.routes.url_helpers.rails_blob_path(object.logo_image, only_path: true), background_image: params[:url]+ Rails.application.routes.url_helpers.rails_blob_path(object.background_image, only_path: true)}
        elsif object.logo_image.attached?
          { id: object.id, banner_title: object.banner_title, banner_description: object.banner_description, submit_button_text: object.submit_button_text , background_colour: object.background_colour , border_redius: object.border_redius, border_width:  object.border_width, border_colour: object.border_colour, border: object.border, alignment: object.alignment, logo_image: params[:url]+ Rails.application.routes.url_helpers.rails_blob_path(object.logo_image, only_path: true)}
        elsif object.background_image.attached?
          { id: object.id, banner_title: object.banner_title, banner_description: object.banner_description, submit_button_text: object.submit_button_text , background_colour: object.background_colour , border_redius: object.border_redius, border_width:  object.border_width, border_colour: object.border_colour, border: object.border, alignment: object.alignment, background_image: params[:url]+ Rails.application.routes.url_helpers.rails_blob_path(object.background_image, only_path: true)}
        end
      end
    end
  end
end
