# frozen_string_literal: true

require 'rails_helper'

describe 'companies routes' do
  it 'should route to companies index' do
    expect(get('/api/v1/companies')).to route_to('api/v1/companies#index')
  end

  it 'should route to companies show' do
    expect(get('/api/v1/companies/1')).to route_to('api/v1/companies#show', id: '1')
  end
end
