class StockSerializer < ActiveModel::Serializer
  attributes :id, :name, :purchase_on, :start_price, :end_price
  # has_one :user
end
