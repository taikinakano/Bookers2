class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment :profile_image
  validates :name, presence: true
  validates :name,    length: { minimum: 2 }  #1文字以上

  with_options on: :update? do
   validates :introduction, presence: true
   validates :profile_image, presence: true
  end


end
