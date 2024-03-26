class Pickitem < ApplicationRecord
  validates :shipper, :shipping_records, presence: true, on: :update
  validates :content, presence: :true
end
