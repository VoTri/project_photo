class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :rates
  has_many :photos
  has_many :comments
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }
  enum role: {user: false, admin: true}, _suffix: true
  rails_admin do
    list do
      field :name do
        label 'Name'
      end
      field :phone do
        label 'Phone'
      end
      field :email do
        label 'Email'
      end
      field :role do
        label 'Role'
      end
    end
  end
end

