module BxBlockTeams
  class TeamsController < ApplicationController

    def index
        all_teams = Team.all
        render json: BxBlockTeams::TeamSerializer.new(all_teams, params: {url: request.base_url})
    end

    def create
      @team = BxBlockTeams::Team.new(team_params)
      if @team.save
        render json: {id: @team.id,name: @team.name, position: @team.position, image: request.base_url+ Rails.application.routes.url_helpers.rails_blob_path(@team.image, only_path: true), linkedin_url: @team.linkedin_url, experience: @team.experience, description: @team.description, designation: @team.designation}
      else
        render json: {
            errors: [{
              error: "Employee Not created!",
            }]
          }, status: :unprocessable_entity
       end
    end

    def update
      @team =  Team.find_by(id: params[:id])
      if @team.update(team_params)
        render json: BxBlockTeams::EmployeeSerializer.new(@team, params: {url: request.base_url})
     else
       render json: {
            errors: [{
              error: "Employee Not updated!",
            }]
          }, status: :unprocessable_entity
       end
    end

    def show
      @team =  Team.find(params[:id])
      render json: {id: @team.id,name: @team.name, position: @team.position, image: request.base_url+ Rails.application.routes.url_helpers.rails_blob_path(@team.image, only_path: true), linkedin_url: @team.linkedin_url, experience: @team.experience, description: @team.description, designation: @team.designation}
    end

    def destroy
      @team =  Team.find(params[:id])
       if @team.destroy
         render json: {message: " Employee deleted!"}
       end
    end

    private

    def team_params
       params.require(:teams).permit(:name, :position, :description, :linkedin_url, :experience, :image, :designation)
    end
  end
end
