class Plant < ApplicationRecord
  has_many :growing_plants
  has_many :plots, through: :growing_plants

end
