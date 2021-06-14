require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
  end

  describe 'instance methods' do

    before :each do
      @garden = Garden.create!(name: "Sunshine Gardens", organic: true)
      @plot_1 = @garden.plots.create!(number: 10, size: "Big", direction: "East")
      @plot_2 = @garden.plots.create!(number: 20, size: "small", direction: "West")
      @plant_1 = Plant.create!(name: 'Ivy', description: 'An ivy plant', days_to_harvest: 90)
      @growing_plant_1 = GrowingPlant.create!(plot: @plot_1, plant: @plant_1)
      @growing_plant_2 = GrowingPlant.create!(plot: @plot_2, plant: @plant_1)
      @growing_plant_3 = GrowingPlant.create!(plot: @plot_2, plant: @plant_1)
      @plant_2 = @plot_1.plants.create!(name: 'Pumpkin', description: 'Orange', days_to_harvest: 180)
      @plant_3 = @plot_2.plants.create!(name: 'Apricot', description: 'Yellow', days_to_harvest: 50)
      @plant_4 = @plot_2.plants.create!(name: 'Blueberry', description: 'Blue', days_to_harvest: 90)
    end

    it 'returns a list of distinct plants with harvest days less than 100' do
      exp_array = [@plant_1, @plant_3, @plant_4]
      expect(@garden.plants_near_harvest.include?(@plant_2)).to eq false
      expect(@garden.plants_near_harvest).to eq exp_array
    end

    it 'sorts plants from all plots sorted by number planted' do
      expect(@garden.sorted_plants_near_harvest.first).to eq @plant_1
      expect(@garden.sorted_plants_near_harvest.first.number_planted).to eq 3
      expect(@garden.sorted_plants_near_harvest.last.number_planted).to eq 1
    end
  end
end
