class ItemHome < ApplicationRecord

    validates :image, presence: true
    validates :name, presence: true
    validates :introduction, presence: true
    validates :place_to_put, presence: true
    validates :category_id, presence: true
    # has_many :images, dependent: :destroy
    belongs_to :category
    belongs_to :customer
    attachment :image
end
