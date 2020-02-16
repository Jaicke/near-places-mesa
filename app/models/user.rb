class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :ratings

  validates_presence_of :password_confirmation, if: -> { password.present? }
  validates :password, confirmation: true, if: -> { password.present? && password_confirmation.present? }

  accepts_nested_attributes_for :profile, allow_destroy: true

  def full_address
    [profile.street, profile.city, profile.state, profile.country].compact.join(', ')
  end
end
