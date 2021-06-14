require 'rails_helper'

RSpec.describe Plant do
  describe 'relationships' do
    it {should have_many :growing_plants}
    it {should have_many(:plots).through(:growing_plants)}
  end

  describe '#growing_plant' do
    it 'finds associated record in growing plant database' do
      @garden = Garden.create!(name: "Sunshine Gardens", organic: true)
      @plot_1 = @garden.plots.create!(number: 10, size: "Big", direction: "East")
      @plant_1 = Plant.create!(name: 'Ivy', description: 'An ivy plant', days_to_harvest: 90)
      @growing_plant_1 = GrowingPlant.create!(plot: @plot_1, plant: @plant_1)

      expect(@plant_1.growing_plant(@plot_1.id)).to eq @growing_plant_1.id
    end
  end
end
