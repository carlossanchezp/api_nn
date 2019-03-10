# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  describe '#validations' do
    it 'should test that the factory is valid' do
      expect(build(:company)).to be_valid
    end

    it 'should validate the presence of the name' do
      company = build :company, name: ''
      expect(company).not_to be_valid
      expect(company.errors.messages[:name]).to include("can't be blank")
    end

    it 'should validate the presence of the content' do
      company = build :company, description: ''
      expect(company).not_to be_valid
      expect(company.errors.messages[:description]).to include("can't be blank")
    end

    it 'should validate the presence of the share_price' do
      company = build :company, share_price: nil
      expect(company).not_to be_valid
      expect(company.errors.messages[:share_price]).to include("can't be blank")
    end

    it 'should validate the presence of the ric' do
      company = build :company, ric: ''
      expect(company).not_to be_valid
      expect(company.errors.messages[:ric]).to include("can't be blank")
    end

    it 'should validate the presence of the country' do
      company = build :company, country: ''
      expect(company).not_to be_valid
      expect(company.errors.messages[:country]).to include("can't be blank")
    end
  end

  describe '.recent' do
    it 'should list recent company first' do
      old_company = create :company
      newer_company = create :company
      expect(described_class.recent).to eq(
        [newer_company, old_company]
      )
      old_company.update_column :created_at, Time.now
      expect(described_class.recent).to eq(
        [old_company, newer_company]
      )
    end
  end
end
