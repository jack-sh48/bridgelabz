module BxBlockStory
  class StoriesController < ApplicationController
    skip_before_action :validate_json_web_token, only: :index
    before_action :find_story, only: [:update, :show, :destroy]
    before_action :find_testimonial, only: [:create, :update]

    def index
      stories = BxBlockStory::Story.all 
      return render json: { message: 'Stories not found' } unless stories.present?
      render json: BxBlockStory::StorySerializer.new(stories,serialization_options).serializable_hash, status: :ok
    end

    def create
      begin
        find_exist_story if @testimonial.present?
        if @exists_story.nil?
          story = current_user.stories.create!(story_params)
          render json: BxBlockStory::StorySerializer.new(story, serialization_options).serializable_hash, status: :created
        else
          render json: BxBlockStory::StorySerializer.new(@exists_story, serialization_options).serializable_hash, status: :ok 
        end
      rescue 
        render json: { errors: format_activerecord_errors(story.errors) }, status: :unprocessable_entity
      end
    end

    def show
      render json: BxBlockStory::StorySerializer.new(@story, serialization_options).serializable_hash, status: :ok
    end

    def update
      begin
        @story.update!(story_params) if @testimonial.present?
        render json: BxBlockStory::StorySerializer.new(@story, serialization_options).serializable_hash,
               status: :ok
      rescue
        render json: { errors: format_activerecord_errors(@story.errors) }, status: :unprocessable_entity 
      end
    end

    def destroy
      @story.destroy
      render json: { meta: { message: 'Story deleted successfully'} }, status: :ok
    end

    private

    def find_testimonial
      @testimonial = current_user.testimonials.find_by('id = ? AND company_id = ?', story_params[:testimonial_id], story_params[:company_id])
      render json: { message: "Testimonial not present"}, status: :not_found and return if @testimonial.nil?
    end

    def find_story
      @story = BxBlockStory::Story.find(params[:id])
    end

    def find_exist_story
      @exists_story = Story.find_by('testimonial_id = ? AND company_id = ?', story_params[:testimonial_id], story_params[:company_id])
    end

    def serialization_options
      { params: { host: request.protocol + request.host_with_port } }
    end

    def story_params
      params.require(:story).permit(:name, :position, :package, :description, :company_id, :testimonial_id, :account_id, :image)
    end
  end 
end