class Category < ApplicationRecord
  has_many :cate_photos
  validates :name, presence: true
  enum status: {Inactive: false, Active: true}, _suffix: true
   rails_admin do
    list do
      field :name do
        label 'Name'
      end
      field :status do
        label 'Status'
      end
    end
  end
end
