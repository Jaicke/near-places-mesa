class Place < ApplicationRecord
  geocoded_by :address

  has_many :ratings, dependent: :destroy

  validates_uniqueness_of :name
  validates_presence_of :name, :country, :state, :city, :street
  
  after_validation :geocode


  private

  def address
    [street, city, state, country].compact.join(', ')
  end
end
