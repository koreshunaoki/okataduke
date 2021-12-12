class Item::Sell < ApplicationRecord
  validates :name, presence: true
  validates :introduction, presence: true
  validates :body, presence: true

  belongs_to :customer
  attachment :image
end
