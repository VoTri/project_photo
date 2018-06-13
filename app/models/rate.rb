class Rate < ApplicationRecord
  belongs_to :photo
  belongs_to :user
  validates :rate_count, presence: true
end
