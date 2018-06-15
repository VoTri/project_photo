class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :cate_photos, dependent: :destroy
  has_many :rates
  accepts_nested_attributes_for :cate_photos, allow_destroy: true,
    reject_if: ->(attrs) { attrs['category_id'].blank? }
  mount_uploader :image_url, ImageUrlUploader
  validates :image_url, presence: true
  validates :title, presence: true
  rails_admin do
    list do
      field :title do
        label 'Title'
      end
      field :description do
        label 'Description'
      end
      field :image_url do
        label 'Image_url'
      end
      field :user_id do
        label 'User'
        formatted_value do
          user = User.find_by(id: value)
          user.nil? ? 'Empty' : user.name
        end
      end
    end

    edit do
      field :title do
        label 'Title'
      end
      field :description do
        label 'Description'
      end
      field :image_url do
        label 'Image_url'
      end
      field :user_id, :enum do
        label "Users"
        enum do
          User.all.map { |u| [u.name, u.id] }
        end
      end
    end
  end
end
