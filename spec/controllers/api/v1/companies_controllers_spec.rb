require 'rails_helper'

describe Api::V1::CompaniesController do
  describe '#index' do
    subject { get :index }

    it 'should return success response' do
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json' do
      create_list :company, 2
      subject

      Company.recent.each_with_index do |company, index|
        expect(json_data[index]['attributes']).to eq({
          "name" => company.name,
          "description" => company.description
        })
      end
    end

    it 'should return companies in the proper order' do
      old_company = create :company
      newer_company = create :company
      subject
      expect(json_data.first['id']).to eq(newer_company.id.to_s)
      expect(json_data.last['id']).to eq(old_company.id.to_s)
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
      expect(json_data['attributes']).to eq({
          "name" => company.name,
          "description" => company.description
      })
    end
  end

end