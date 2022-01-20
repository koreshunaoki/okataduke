class Category < ApplicationRecord
    
   
    
  #self.data = [
  #  { id: 0, name: '--' },
  #  { id: 1, name: '犬' },
  #  { id: 2, name: '猫' },
  #  { id: 3, name: '鳥' },
  #  { id: 4, name: '魚' },
  #  { id: 5, name: '爬虫類' },
  # { id: 6, name: '両生類' },
  # { id: 7, name: '昆虫' },
  # { id: 8, name: 'その他' }
 #]
  has_many :items, dependent: :destroy
  has_many :item_items, dependent: :destroy
end
