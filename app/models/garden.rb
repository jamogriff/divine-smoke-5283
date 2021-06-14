class Garden < ApplicationRecord
  has_many :plots

  def plants_near_harvest
    Plant.joins(:plots).where("plots.garden_id = ?", self.id).where("plants.days_to_harvest < 100").distinct
  end

  def sorted_plants_near_harvest
    Plant.joins(:plots).where("plots.garden_id = ?", self.id).where("plants.days_to_harvest < 100").select("count('plants.*') as number_planted, plants.*").group(:id).order("number_planted desc")
  end
end
