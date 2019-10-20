class Post < ApplicationRecord
    belongs_to :genre
    has_many :comments, dependent: :destroy
    has_many :favos, dependent: :destroy
    belongs_to :user
    def favorited_by?(user)
        favos.where(user_id: user.id).exists?
    end
end

