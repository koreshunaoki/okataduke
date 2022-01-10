class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :comments, dependent: :destroy
  # has_many :images, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  #退会したユーザーをログインできなくする


end
