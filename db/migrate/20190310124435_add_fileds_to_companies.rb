# frozen_string_literal: true

class AddFiledsToCompanies < ActiveRecord::Migration[5.2]
  def up
    add_column :companies, :share_price, :float
    add_column :companies, :ric, :string
    add_column :companies, :country, :string
  end

  def down
    remove_column :companies, :share_price
    remove_column :companies, :ric
    remove_column :companies, :country
  end
end
