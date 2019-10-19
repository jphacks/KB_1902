class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
<<<<<<< HEAD
         :recoverable, :rememberable, :validatable
=======
          :recoverable, :rememberable, :validatable
>>>>>>> 6afaa11e71654d0f7a8f431a8f5a2b7b077c422f
  def email_required?
    false
  end
  def email_changed?
    false
  end
<<<<<<< HEAD
=======

  has_many :comments, dependent: :destroy
  has_many :posts,dependent: :destroy
>>>>>>> 6afaa11e71654d0f7a8f431a8f5a2b7b077c422f
end
