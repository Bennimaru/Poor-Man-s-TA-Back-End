class Location < ApplicationRecord
  has_many :reiviews
  belongs_to :borough, optional: true
end
