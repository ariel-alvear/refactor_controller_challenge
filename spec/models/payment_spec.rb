require 'rails_helper'

RSpec.describe Payment, type: :model do
  it 'makes price to decimal and multiplies per 100' do 
    def to_decimal_per_100(x)
      x.to_d * 100
    end
    price1 = 1
    price2 = to_decimal_per_100(price1)

    expect(price2).to eq(100.00)
  end
end
