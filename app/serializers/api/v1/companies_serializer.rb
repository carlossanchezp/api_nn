class Api::V1::CompaniesSerializer < ActiveModel::Serializer
  attributes :name, :description
end
