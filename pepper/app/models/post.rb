class Post < ApplicationRecord
    belongs_to :genre
    has_many :comments, dependent: :destroy
    belongs_to :user
end

