class CatePhoto < ApplicationRecord
  belongs_to :category
  belongs_to :photo
end
