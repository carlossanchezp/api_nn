class Api::V1::CompaniesController < ApplicationController

  def index
    companies = Company.recent

    render(json: companies, 
            each_serializer: Api::V1::CompaniesSerializer, 
      )
  end

  def show
    company =  Company.find(params[:id])
    render json: Api::V1::CompaniesSerializer.new(company)

  end

  private

  def movie_params
    params.require(:data).require(:attributes).
      permit(:name, :description) ||
    ActionController::Parameters.new
  end
end