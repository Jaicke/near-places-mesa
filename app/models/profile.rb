class Profile < ApplicationRecord
  geocoded_by :full_address

  belongs_to :user

  validates_presence_of :name, :country, :state, :city, :street

  after_validation :geocode

  def full_address
    [street, city, state, country].compact.join(', ')
  end

  def coordinates
    [latitude, longitude]
  end
end
