class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :state, :city, :state, :place #アクセスメソッドの定義

  has_many :cart_details
  has_many :orders
  has_many :contacts #うまくいかないかも
end
