module BxBlockStory
  class CompaniesController < ApplicationController
    skip_before_action :validate_json_web_token, only: :index
    before_action :find_companies, only: [:show, :update, :destroy]

    def index
      companies = BxBlockStory::Company.all 
      return render json: { errors: 'company not found' } unless companies.present?
      render json: BxBlockStory::CompanySerializer.new(companies,serialization_options).serializable_hash, status: :ok
    end

    def create
      company = current_user.companies.new(company_params)
      begin
        company.save!
        render json: BxBlockStory::CompanySerializer.new(company, serialization_options).serializable_hash, status: :created
      rescue
        render json: { errors: format_activerecord_errors(company.errors) }, status: :unprocessable_entity
      end
    end

    def show
      render json: BxBlockStory::CompanySerializer.new(@company, serialization_options).serializable_hash, status: :ok
    end

    def update
      begin 
        @company.update!(company_params)
        render json: BxBlockStory::CompanySerializer.new(@company, serialization_options).serializable_hash,
               status: :ok
      rescue
        render json: { errors: format_activerecord_errors(@company.errors) }, status: :unprocessable_entity 
      end
    end

    def destroy
      @company.destroy
      render json: { meta: { message: 'Company Deleted successfully' } }, status: :ok
    end

    private

    def find_companies
      @company = BxBlockStory::Company.find(params[:id])
    end

    def serialization_options
      { params: { host: request.protocol + request.host_with_port } }
    end

    def company_params
      params.require(:company).permit(:company_name, :subtitle, :location, :description, :logo)
    end

  end
end
