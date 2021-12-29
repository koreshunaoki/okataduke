class ItemHome < ApplicationRecord
    
    validates :image, presence: { message: 'は入力してください。' }
    # has_many :images, dependent: :destroy
    belongs_to :category
    belongs_to :customer
    attachment :image
end
