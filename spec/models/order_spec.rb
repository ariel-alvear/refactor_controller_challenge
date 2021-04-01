require 'rails_helper'

RSpec.describe Order, type: :model do
  it "makes order price * 100" do 
    order1 = Order.create(total: 1)
    total = order1.price_in_cents

    expect(total).to eq(100)
  end
  it "adding products with 0 stock is not valid" do
    product = Product.create(id: 1, name: 'test', stock: 0)
    current_order =  Order.create(state: "created")
    
    expect(current_order.add_product(1, 1)).to be_nil
  end
end
