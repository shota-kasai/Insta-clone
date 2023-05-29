class Post < ApplicationRecord
  belongs_to :user
  
  validate :image
  validates :caption, presence: true, length: {maximum: 255 }
  
  has_one_attached :image
  
  with_options presence: true do
    validates :image
  end
end
