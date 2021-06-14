class Plant < ApplicationRecord
  has_many :growing_plants
  has_many :plots, through: :growing_plants

  # Since there could be the same plant in two plots, we need to find the
  # record only in a certain plot
  def growing_plant(plot_id)
    self.growing_plants.where("growing_plants.plot_id = ?", plot_id).pluck(:id).first
  end
end
