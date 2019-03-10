# frozen_string_literal: true

class CompaniesHardWorker
  include Sidekiq::Worker

  def perform(*args)
    case args[0]
    when 'update all share price'
      create_new_share_price_for_all_companies
    when 'update company share price'
      create_new_share_price(args[1])
    end
  end

  private

  def create_new_share_price_for_all_companies
    Company.all.each do |company|
      new_share_price = company.share_price + web_service_share_price(company)
      company.update(share_price: new_share_price)
    end
  end

  def create_new_share_price(id)
    company = Company.find id
    update_share_price_for_company(company) if company.present?
  end

  # Simulate share price find external service
  def web_service_share_price(_company)
    # ckech external share price for company
    0.25
  end

  def update_share_price_for_company(company)
    share_price = 0.25
    new_share_price = company.share_price + share_price
    company.update(share_price: new_share_price)
  end
end
