class Address < ApplicationRecord
  validates :name, presence: true
  validates :postal_code, presence: true, length: { is: 7 }
  validates :address, presence: true

  belongs_to :customer
  # def address_detail
  #   "#{self.postal_code} #{self.address} #{self.name}"
  # end
end
