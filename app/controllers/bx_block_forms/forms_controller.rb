module BxBlockForms
  class FormsController < ApplicationController

    def index
        all_forms = Form.all
        render json: BxBlockForms::FormSerializer.new(all_forms, params: {url: request.base_url})
    end

    def create
      @form = BxBlockForms::Form.new(form_params)
      if @form.save
        render json: BxBlockForms::FormSerializer.new(@form, params: {url: request.base_url})
      else
        render json: {
            errors: [{
              error: "Form Not created!",
            }]
          }, status: :unprocessable_entity
       end
    end

    def update
      @form =  Form.find_by(id: params[:id])
      if @form&.update(form_params)
          render json: BxBlockForms::FormSerializer.new(@form, params: {url: request.base_url})
       else
         render json: {
              errors: [{
                error: "Form Not updated!",
              }]
            }, status: :unprocessable_entity
      end
    end

    def show
      @form =  Form.find_by(id: params[:id])
      unless @form.nil?
        @image = request.base_url+ Rails.application.routes.url_helpers.rails_blob_path(@form.image, only_path: true)if @form.image.attached?

        render json: BxBlockForms::FormSerializer.new(@form, params: {url: request.base_url})
      else
        render json: {errors: [{message: "No record found"}]}, status: 404
      end
    end

    def destroy
      @form =  Form.find(params[:id])
       if @form.destroy
         render json: {message: " Form deleted!"}
       end
    end

    private

    def form_params
       params.require(:forms).permit(:image, :page_title, :page_description, :submit_button_text, :field_name, :field_description, :field_type, :background_colour, :border_redius, :border_width, :border_colour, :border, :alignment)
    end
  end
end
