class Payment < ApplicationRecord
  belongs_to :order
  belongs_to :payment_method

  #method from controller

  def self.create_order(order, payment_method, response)
    self.create(
      order_id: order.id,
      payment_method_id: payment_method.id,
      state: "processing",
      total: order.total,
      token: response.token
    )
  end

  def to_decimal_per_100(x)
    x.to_d * 100
  end

  def express_purchase_options(request, token, details)
    {
      ip: request.remote_ip,
      token: token,
      payer_id: details.payer_id,
      currency: "USD"
    }
  end

end
