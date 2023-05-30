class Post < ApplicationRecord
  belongs_to :user
  
  validate :image
  validates :caption, presence: true, length: {maximum: 255 }
  
  has_one_attached :image
  
  with_options presence: true do
    validates :image
  end
  
  has_many :reverses_of_favorite, class_name: 'Favorite', foreign_key: 'post_id', dependent: :destroy
  has_many :liked, through: :reverses_of_favorite, source: :user
end
