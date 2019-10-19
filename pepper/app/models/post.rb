class Post < ApplicationRecord
    belongs_to :genre,dependent: :destroy
    has_many :comments, dependent: :destroy
    belongs_to :user
end

