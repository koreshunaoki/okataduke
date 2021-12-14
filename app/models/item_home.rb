class ItemHome < ApplicationRecord
  belongs_to :customer
  attachment :image
end
