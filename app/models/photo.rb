class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :cate_photos
  has_many :rates
  validates :image_url, presence: true
  validates :title, presence: true
end
