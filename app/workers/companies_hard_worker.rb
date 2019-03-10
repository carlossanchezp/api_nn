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
    Company.find_each(batch_size: 100) do |company|
      # TODO: In a future with a lot fo companies separates in other workers for updates
      # with Redis update share price before send de update to worker
      new_share_price = company.share_price + web_service_share_price(company)
      company.update(share_price: new_share_price)
    end
  end

  def create_new_share_price(id)
    company = Company.find id
    update_share_price_for_company(company) if company.present?
  end

  # Simulate share price find external service
  def web_service_share_price(company)
    # ckech external share price for company
    0.25
  end

  def update_share_price_for_company(company)
    new_share_price = company.share_price + web_service_share_price(company)
    company.update(share_price: new_share_price)
  end
end
