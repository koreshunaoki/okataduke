class ItemHome < ApplicationRecord

    validates :image, presence: true
    validates :name, presence: true
    validates :introduction, presence: true
    validates :place_to_put, presence: true
    validates :category_id, presence: true
    # has_many :images, dependent: :destroy
    belongs_to :category
    belongs_to :customer
    has_one :item
    attachment :image

  def self.sort(selection,word,search)
    case selection
    when 'new'
      return all.order(created_at: :DESC)
    when 'old'
      return all.order(created_at: :ASC)
    end
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @home = ItemHome.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @home = ItemHome.where("name LIKE?", "#{word}")
    elsif search == "backward_match"
      @home = ItemHome.where("name LIKE?", "#{word}")
    elsif search == "partial_match"
      @home = ItemHome.where("name LIKE?", "#{word}")
    elsif search == "place_to_put"
      @home = ItemHome.where("name LIKE?", "#{word}")
    else
      @home = ItemHome.all
    end
  end
end
