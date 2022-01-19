class Order < ApplicationRecord
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :payment_method, presence: true
  validates :postal_code, presence: true
  validates :postal_code, length: { is: 7 }
  
  
  
  belongs_to :customer
  belongs_to :item
  enum payment_method: { credit_card: 0, transfer: 1 }
end
