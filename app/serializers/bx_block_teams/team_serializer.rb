module BxBlockTeams
  class TeamSerializer < BuilderBase::BaseSerializer

    attribute :team_data do |object, params|
      team_for(object, params)
    end

    private
    class << self
      def team_for(object, params)
      {id: object.id,name: object.name, position: object.position, image: params[:url]+ Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true), linkedin_url: object.linkedin_url, experience: object.experience, description: object.description, designation: object.designation}
      end
    end
  end
end
