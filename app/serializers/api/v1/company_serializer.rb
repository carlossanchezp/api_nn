# frozen_string_literal: true

class Api::V1::CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :ric, :sharePrice, :description, :country

  def sharePrice
    object.object.share_price
  end
end
