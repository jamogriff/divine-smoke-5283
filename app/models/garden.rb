class Garden < ApplicationRecord
  has_many :plots

  def plants_near_harvest
    Plant.joins(:plots).where("plots.garden_id = ?", self.id).where("plants.days_to_harvest < 100").distinct
  end
end
