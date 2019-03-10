# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::CompaniesController do
  describe '#index' do
    subject { get :index }

    it 'should return success response' do
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json' do
      create_list :company, 3
      subject

      Company.recent.each_with_index do |company, index|
        expect(json[index]).to eq(
          'id' => company.id,
          'name' => company.name,
          'ric' => company.ric,
          'sharePrice' => company.share_price
        )
      end
    end

    it 'should return companies in the proper order' do
      old_company = create :company
      newer_company = create :company
      subject

      expect(json.first['id']).to eq(newer_company.id)
      expect(json.last['id']).to eq(old_company.id)
    end
  end

  describe '#show' do
    let(:company) { create :company }
    subject { get :show, params: { id: company.id } }

    it 'should return success response' do
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json' do
      subject
      expect(json).to eq(
        'id' => company.id,
        'name' => company.name,
        'ric' => company.ric,
        'sharePrice' => company.share_price,
        'description' => company.description,
        'country' => company.country
      )
    end
  end
end
