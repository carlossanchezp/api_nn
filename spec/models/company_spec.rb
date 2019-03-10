require 'rails_helper'

RSpec.describe Company, type: :model do

  describe '#validations' do
    it 'should test that the factory is valid' do
      expect(build :company).to be_valid
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

  end

end
