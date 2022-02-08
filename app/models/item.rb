class Item < ApplicationRecord

  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 9999999}

  has_one :order
  belongs_to :item_home, optional: true
  belongs_to :category
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :image
  enum order_status: {unknown: 0, sale: 1, purchased: 2}

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end


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