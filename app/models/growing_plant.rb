class GrowingPlant < ApplicationRecord
  belongs_to :plot
  belongs_to :plant
end
