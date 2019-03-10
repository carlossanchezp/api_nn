# frozen_string_literal: true

class Api::V1::CompaniesController < ApplicationController
  before_action :set_company, only: :show
  before_action :set_share_all_price, only: :index
  before_action :set_share_price, only: :show

  def index
    companies = Company.recent

    render(json: companies,
           each_serializer: Api::V1::CompaniesToListSerializer)
  end

  def show
    render json: Api::V1::CompanySerializer.new(@company)
  end

  private

  def set_share_all_price
    CompaniesHardWorker.perform_async('update all share price')
  end

  def set_share_price
    company_id = Company.where(id: params[:id]).pluck(:id).first
    CompaniesHardWorker.perform_async('update company share price', company_id)
  end

  # setting data
  def set_company
    @company = Company.find_by(id: params[:id])
    render_404('Company') unless @company
  end
end
