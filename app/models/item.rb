class Item < ApplicationRecord
    
    validates :image, presence: true
    
    has_one :order
    has_many :images, dependent: :destroy
    belongs_to :category
    belongs_to :customer
    has_many :comments, dependent: :destroy
    attachment :image
    enum order_status: {sale: 0,purchased: 1}
end
