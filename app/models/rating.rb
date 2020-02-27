class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates_presence_of :note
  validates_numericality_of :note, greater_than_or_equal_to: 0, less_than_or_equal_to: 5

end
