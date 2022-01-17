class Item < ApplicationRecord

    validates :image, presence: true
    validates :name, presence: true
    validates :introduction, presence: true
    validates :price, presence: true
    validates :category_id, presence: true

    has_one :order
    has_one :item_home
    #has_many :images, dependent: :destroy
    belongs_to :category
    belongs_to :customer
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    def favorited_by?(customer)
      favorites.where(customer_id: customer.id).exists?
    end
    attachment :image
    enum order_status: {unknown: 0, sale: 1, purchased: 2}

    def self.sort(selection)
      case selection
      when 'new'
        return all.where(is_deleted: false).order(created_at: :DESC)
      when 'old'
        return all.where(is_deleted: false).order(created_at: :ASC)
      when 'likes'
        # likes > 0
        array1 = where(id: Favorite.group(:item_id).order(Arel.sql('count(item_id) desc')).pluck(:item_id)).where(is_deleted: false)
        # likes = 0
        array2 = all.where(is_deleted: false) - where(id: Favorite.group(:item_id).pluck(:item_id)).where(is_deleted: false)
        return array1 + array2
        #return where(id: Favorite.group(:item_id).order(Arel.sql('count(item_id) desc')).pluck(:item_id)).where(is_deleted: false)
      when 'dislikes'
        # likes  0
        array1 = all.where(is_deleted: false) - where(id: Favorite.group(:item_id).pluck(:item_id)).where(is_deleted: false)
        # likes = 0
        array2 = where(id: Favorite.group(:item_id).order(Arel.sql('count(item_id) asc')).pluck(:item_id)).where(is_deleted: false)
        return array1 + array2
      when 'high'
        return all.where(is_deleted: false).order(price: :DESC)
      when 'low'
        return all.where(is_deleted: false).order(price: :ASC)
      end
    end


    def self.looks(search, word)
      if search == "perfect_match"
        @item = Item.where("name LIKE?","#{word}")
      elsif search == "forward_match"
        @item = Item.where("name LIKE?","#{word}")
      elsif search == "backward_match"
        @item = Item.where("nameLIKE?","#{word}")
      elsif search == "partial_match"
        @item = Item.where("name LIKE?","#{word}")
      elsif search == "sale"
        @item = Item.where("name LIKE?","#{word}")
      elsif search == "purchased"
        @item = Item.where("name LIKE?","#{word}")
      else
        @item = Item.all
      end
    end
end
