module BxBlockForms
  class FormSerializer < BuilderBase::BaseSerializer

    attribute :form_data do |object, params|
      form_for(object, params)
    end

    private
    class << self
      def form_for(object, params)
        if object.image.attached?
          { id: object.id, page_title: object.page_title, page_description: object.page_description, submit_button_text: object.submit_button_text , field_name: object.field_name, field_description: object.field_description, field_type: object.field_type, background_colour: object.background_colour , border_redius: object.border_redius, border_width:  object.border_width, border_colour: object.border_colour, border: object.border, alignment: object.alignment, image: params[:url]+ Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)}
        else
          { id: object.id, page_title: object.page_title, page_description: object.page_description, submit_button_text: object.submit_button_text , field_name: object.field_name, field_description: object.field_description, field_type: object.field_type, background_colour: object.background_colour , border_redius: object.border_redius, border_width:  object.border_width, border_colour: object.border_colour, border: object.border, alignment: object.alignment, image: nil}
        end
      end
    end
  end
end
