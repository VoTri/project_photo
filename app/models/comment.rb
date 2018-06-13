class Comment < ApplicationRecord
  belongs_to :photo
  belongs_to :user
  validates :description, presence: true, limit: {minimun: 1}
end
