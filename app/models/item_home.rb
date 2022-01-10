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
    
    
  def self.looks(search, word)
    if search == "perfect_match"
      @home = ItemHome.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @home = ItemHome.where("name LIKE?", "#{word}")
    elsif search == "backward_match"
      @home = ItemHome.where("name LIKE?", "#{word}")
    elsif search == "partial_match"
      @home = ItemHome.where("name LIKE?", "#{word}")
    else
      @home = ItemHome.all
    end
  end
end
