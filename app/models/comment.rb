class Comment < ApplicationRecord
  belongs_to :photo
  belongs_to :user
  validates :description, presence: true
  rails_admin do
    list do
      field :description do
        label 'Description'
      end
      field :photo_id do
        label 'Photo name'
        formatted_value do
          Photos.find_by(id: value).name
        end
      end
      field :email do
        label 'User'
        formatted_value do
          Users.find_by(id: value).name
        end
      end
    end
  end
end
