class Category < ApplicationRecord
  has_many :cate_photos
  validates :name, presence: true
end
