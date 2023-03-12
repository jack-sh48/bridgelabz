module BxBlockStory
  class TestimonialsController < ApplicationController
    skip_before_action :validate_json_web_token, only: :index
    before_action :find_testimonial, only: [:show, :update, :destroy]

    def index
      testimonials = BxBlockStory::Testimonial.all
      return render json: { message: 'Testimonials not found' } unless testimonials.present?
      render json: BxBlockStory::TestimonialSerializer.new(testimonials,serialization_options).serializable_hash, status: :ok
    end

    def create
      testimonial = current_user.testimonials.new(testimonial_params)
      begin 
        testimonial.save!
        render json: BxBlockStory::TestimonialSerializer.new(testimonial, serialization_options).serializable_hash, status: :created
      rescue 
        render json: { errors: format_activerecord_errors(testimonial.errors) }, status: :unprocessable_entity
      end
    end

    def show
      render json: BxBlockStory::TestimonialSerializer.new(@testimonial, serialization_options).serializable_hash, status: :ok 
    end

    def update
      begin 
        @testimonial.update!(testimonial_params)
        render json: BxBlockStory::TestimonialSerializer.new(@testimonial, serialization_options).serializable_hash,
               status: :ok
      rescue
        render json: { errors: format_activerecord_errors(@testimonial.errors) }, status: :unprocessable_entity
      end
    end

    def destroy
      @testimonial.destroy
      render json: { meta: { message: 'Testimonial Deleted successfully' } }, status: :ok
    end

    private

    def find_testimonial
      @testimonial = BxBlockStory::Testimonial.find(params[:id])
    end

    def serialization_options
      { params: { host: request.protocol + request.host_with_port } }
    end

    def testimonial_params
      params.require(:testimonial).permit(:name, :company_name, :position, :content, :video_url, :link, :description, :company_id, :account_id)
    end

  end
end