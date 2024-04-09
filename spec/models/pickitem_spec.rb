require 'rails_helper'

RSpec.describe Pickitem, type: :model do
  describe 'ピッキング実績更新' do
    let(:pickitem){ Pickitem.create(shipper: "12345", shipping_records: 3)}

    it 'shipperが入力されかつshipping_recordsが入力されれば更新できる' do
      pickitem.update(shipper: "99999", shipping_records: 9)
      expect(pickitem.shipper).to eq("99999")
      expect(pickitem.shipping_records).to eq(9)
    end
    it 'shipperが空では更新できない' do
      pickitem.update(shipper: nil)
      expect(pickitem.errors[:shipper]).to include("can't be blank")
    end
    it 'shipping_recordsが空では更新できない' do
      pickitem.update(shipping_records: nil)
      expect(pickitem.errors[:shipping_records]).to include("can't be blank")
    end
  end
end
