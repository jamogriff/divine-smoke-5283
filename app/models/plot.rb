class Plot < ApplicationRecord
  belongs_to :garden
  has_many :growing_plants
  has_many :plants, through: :growing_plants
end
