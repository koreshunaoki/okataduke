class Item < ApplicationRecord

  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 9999999}

  has_one :order
  belongs_to :item_home, optional: true
  #has_many :images, dependent: :destroy
  belongs_to :category
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :image
  enum order_status: {unknown: 0, sale: 1, purchased: 2}

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  # def self.sort_at(selection)
  #   case selection
  #   when 'new'
  #     return self.where(is_deleted: false).order(created_at: :DESC)
  #   when 'old'
  #     return self.where(is_deleted: false).order(created_at: :ASC)
  #   when 'likes'
  #     # likes > 0
  #     array1 = self.where(is_deleted: false).where(id: Favorite.group(:item_id).order(Arel.sql('count(item_id) desc')).pluck(:item_id)).where(is_deleted: false)
  #     # likes = 0
  #     array2 = self.where(is_deleted: false) - where(id: Favorite.group(:item_id).pluck(:item_id)).where(is_deleted: false)
  #     return array1 + array2
  #     #return where(id: Favorite.group(:item_id).order(Arel.sql('count(item_id) desc')).pluck(:item_id)).where(is_deleted: false)
  #   when 'dislikes'
  #     array1 = self.where(is_deleted: false). - where(id: Favorite.group(:item_id).pluck(:item_id)).where(is_deleted: false)
  #     array2 = self.where(is_deleted: false).where(id: Favorite.group(:item_id).order(Arel.sql('count(item_id) asc')).pluck(:item_id)).where(is_deleted: false)
  #     return array1 + array2
  #   when 'high'
  #     return self.where(is_deleted: false).order(price: :DESC)
  #   when 'low'
  #     return self.where(is_deleted: false).order(price: :ASC)
  #   end
  # end


  def self.looks(search, word, sale_status)
    if search == "perfect_match"
      @item = Item.where("name LIKE?","#{word}").where(order_status: sale_status)
    elsif search == "forward_match"
      @item = Item.where("name LIKE?","#{word}%").where(order_status: sale_status)
    elsif search == "backward_match"
      @item = Item.where("name LIKE?","%#{word}").where(order_status: sale_status)
    elsif search == "partial_match"
      @item = Item.where("name LIKE?","%#{word}%").where(order_status: sale_status)
    else
      @item = Item.all
    end
  end
end