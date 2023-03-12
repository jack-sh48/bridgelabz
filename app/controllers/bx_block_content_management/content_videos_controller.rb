module BxBlockContentManagement
  class ContentVideosController < ApplicationController
    
    skip_before_action :validate_json_web_token, only: :index
    before_action :find_content_video, only: [:show, :update, :destroy]

    def index
      videos = BxBlockContentManagement::ContentVideo.all
    	# videos = current_user&.content_videos
      return render json: { message: 'videos not found' } unless videos.present?
    	 render json: BxBlockContentManagement::ContentVideoSerializer.new(videos,serialization_options).serializable_hash, status: :ok
    end

    def create
      video = current_user.content_videos.new(video_params)
      begin  
    	 video.save!
       render json: BxBlockContentManagement::ContentVideoSerializer.new(video, serialization_options).serializable_hash, status: :created
      rescue
        render json: { errors: format_activerecord_errors(video.errors) }, status: :unprocessable_entity
      end
    end

    def show
      render json: BxBlockContentManagement::ContentVideoSerializer.new(@video, serialization_options).serializable_hash, status: :ok
    end

    def update
      begin 
        @video.update!(video_params)
        render json: BxBlockContentManagement::ContentVideoSerializer.new(@video, serialization_options).serializable_hash,
               status: :ok
      rescue
        render json: { errors: format_activerecord_errors(@video.errors) }, status: :unprocessable_entity
      end 
    end

    def destroy
      @video.destroy
      render json: { meta: { message: 'Video Content Deleted successfully' } }, status: :ok
    end

    private

    def find_content_video
    	@video = BxBlockContentManagement::ContentVideo.find(params[:id])
    end

    def serialization_options
      { params: { host: request.protocol + request.host_with_port } }
    end

    def video_params
      params.require(:content_video).permit(:name, :url, :description, :account_id)
    end
  end
end
