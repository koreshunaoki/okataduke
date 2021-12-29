class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: {sale: 0,purchased: 1}
end
