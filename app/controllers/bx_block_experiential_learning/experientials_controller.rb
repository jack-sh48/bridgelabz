module BxBlockExperientialLearning
  class ExperientialsController < ApplicationController

    def index
      render json: Experiential.all
    end

    def create
      @experiential = Experiential.new(experiential_params)
      if @experiential.save
        render json: @experiential
      else
        render json: {
            errors: [{
              error: "Experiential Not created!",
            }]
          }, status: :unprocessable_entity
       end
    end

    def update
      @experiential =  Experiential.find(params[:id])
      if @experiential.update(experiential_params)
         render json: @experiential
       end
    end

    def show
      @experiential =  Experiential.find(params[:id])
      render json: {id: @experiential.id, hours_of_coding: @experiential.hours_of_coding, weeks_online_program: @experiential.weeks_online_program, live_session: @experiential.live_session, experienced_industry_expert: @experiential.experienced_industry_expert}
    end

    def destroy
      @experiential =  Experiential.find(params[:id])
       if @experiential.destroy
         render json: {message: " Experiential deleted!"}
       end
    end

    private

    def experiential_params
       params.require(:experiential).permit(:hours_of_coding, :weeks_online_program, :live_session, :experienced_industry_expert)
    end
  end
end
