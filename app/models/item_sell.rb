class ItemSell < ApplicationRecord
  validates :name, presence: true
  validates :introduction, presence: true

  belongs_to :customer
  attachment :image
end
