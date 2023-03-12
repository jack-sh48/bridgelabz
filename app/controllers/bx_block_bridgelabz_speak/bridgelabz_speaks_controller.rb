module BxBlockBridgelabzSpeak
  class BridgelabzSpeaksController < ApplicationController
    skip_before_action :validate_json_web_token, only: :index
    before_action :check_bridgelabz_speaks, only: [:update, :show, :destroy]

    def index
      bridgelabz_speaks = BxBlockBridgelabzSpeak::BridgelabzSpeak.all
      return render json: { errors: 'bridgelabz speaks not found' } unless bridgelabz_speaks.present?
      render json: BxBlockBridgelabzSpeak::BridgelabzSpeakSerializer.new(bridgelabz_speaks,serialization_options).serializable_hash, status: :ok
    end

    def create
      begin
        bridgelabz_speak = current_user.bridgelabz_speaks.new(bridgelabz_speak_params)
        bridgelabz_speak.save!
        render json: BxBlockBridgelabzSpeak::BridgelabzSpeakSerializer.new(bridgelabz_speak,serialization_options).serializable_hash, status: :created 
      rescue
        render json: { errors: format_activerecord_errors(bridgelabz_speak.errors) }, status: :unprocessable_entity
      end
    end

    def show
      render json: BxBlockBridgelabzSpeak::BridgelabzSpeakSerializer.new(@bridgelabz_speak,serialization_options).serializable_hash, status: :ok 
    end

    def update
      begin
        @bridgelabz_speak.update!(bridgelabz_speak_params)
        render json: BxBlockBridgelabzSpeak::BridgelabzSpeakSerializer.new(@bridgelabz_speak,serialization_options).serializable_hash, status: :ok 
      rescue
        render json: { errors: format_activerecord_errors(@bridgelabz_speak.errors) }, status: :unprocessable_entity
      end
    end

    def destroy
      @bridgelabz_speak.destroy
      render json: { meta: { message: 'Bridgelabz Speak Deleted successfully'}}, status: :ok
    end

    private 

    def check_bridgelabz_speaks
      @bridgelabz_speak = BxBlockBridgelabzSpeak::BridgelabzSpeak.find(params[:id])
    end

    def bridgelabz_speak_params
      params.require(:bridgelabz_speak).permit(:title, :subtitle, :video, :content, :description, :youtube_link, :website_link, :bridgelabz_speak_image)
    end

  end
end