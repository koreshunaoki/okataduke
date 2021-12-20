class ItemSell < ApplicationRecord
  validates :name, presence: true
  validates :introduction, presence: true

  belongs_to :customer
  belongs_to :category
  attachment :image
end
