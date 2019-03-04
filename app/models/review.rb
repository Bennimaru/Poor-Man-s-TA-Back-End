class Review < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates :rating, :inclusion => { :in => 0..5 }
end
