module BxBlockLandingpage
  class ScholarshipsController < ApplicationController
    skip_before_action :validate_json_web_token, :only => [:scholar, :experience]

    def scholar
      @scholarship = BxBlockLandingpage::Scholarship.new(scholarship_params)
      if @scholarship.save
        render json: {message: "Thanks For Sharing Info!"}
      else
        render json: {
            errors: [{
              error: "Please fill all column",
            }]
          }, status: :unprocessable_entity
       end
    end

    def experience
      @experience = BxBlockLandingpage::Scholarship.new(experience_params)
      if @experience.save
        render json: {message: "Thanks For Sharing Info!"}
      else
        render json: {
            errors: [{
              error: "Please fill all column",
            }]
          }, status: :unprocessable_entity
       end
    end

    private

    def scholarship_params
       params.require(:scholarship).permit(:first_name, :last_name,:email, :qualification, :passout_year)
    end

    def experience_params
       params.require(:scholarship).permit(:first_name, :last_name,:email, :qualification, :passout_year, :mobile, :work_area, :experience)
    end
  end
end
