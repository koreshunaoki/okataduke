class Item < ApplicationRecord
    
    validates :image, presence: true
    validates :name, presence: true
    validates :introduction, presence: true
    validates :price, presence: true
    validates :category_id, presence: true
    
    has_one :order
    #has_many :images, dependent: :destroy
    belongs_to :category
    belongs_to :customer
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    def favorited_by?(customer)
      favorites.where(customer_id: customer.id).exists?
    end
    attachment :image
    enum order_status: {sale: 0,purchased: 1}
    
    
    def self.looks(search, word)
      if search == "perfect_match"
        @item = Item.where("name LIKE?","#{word}")
      elsif search == "forward_match"
        @item = Item.where("name LIKE?","#{word}")
      elsif search == "backward_match"
        @item = Item.where("nameLIKE?","#{word}")
      elsif search == "partial_match"
        @item = Item.where("name LIKE?","#{word}")
      else
        @item = Item.all
      end
    end
end
