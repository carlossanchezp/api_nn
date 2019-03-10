# frozen_string_literal: true

class Api::V1::CompaniesToListSerializer < ActiveModel::Serializer
  attributes :id, :name, :ric, :sharePrice

  def sharePrice
    object.share_price
  end
end
