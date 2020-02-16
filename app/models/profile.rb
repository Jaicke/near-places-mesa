class Profile < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :country, :state, :city, :street
end
