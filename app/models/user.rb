class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :books 
         has_many :applications
         has_many :post_comments, dependent: :destroy
         attachment :profile_image

        validates :username,    length: { minimum: 2 }       
        validates :username,    length: { maximum: 20 } 
        validates :introduction, length: {maximum: 50}
        
end