class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  def email_required?
    false
  end
  def email_changed?
    false
  end

  has_many :comments, dependent: :destroy
  has_many :favos, dependent: :destroy
  has_many :posts,dependent: :destroy

  def favorited_by?(user)
    favos.where(user_id: user.id).exists?
  end
end
