require 'rails_helper'

RSpec.describe 'garden show page' do

  before :each do
      @garden = Garden.create!(name: "Sunshine Gardens", organic: true)
      @plot_1 = @garden.plots.create!(number: 10, size: "Big", direction: "East")
      @plot_2 = @garden.plots.create!(number: 20, size: "small", direction: "West")
      @plant_1 = Plant.create!(name: 'Ivy', description: 'An ivy plant', days_to_harvest: 90)
      @growing_plant_1 = GrowingPlant.create!(plot: @plot_1, plant: @plant_1)
      @growing_plant_2 = GrowingPlant.create!(plot: @plot_2, plant: @plant_1)
      @plant_2 = @plot_1.plants.create!(name: 'Pumpkin', description: 'Orange', days_to_harvest: 180)
      @plant_3 = @plot_2.plants.create!(name: 'Apricot', description: 'Yellow', days_to_harvest: 50)
      @plant_4 = @plot_2.plants.create!(name: 'Blueberry', description: 'Blue', days_to_harvest: 90)
  end

  it 'shows distinct plants from all plots near harvest ordered by number planted' do
    visit "/gardens/#{@garden.id}"
    expect(page).to have_content @plant_1.name
    expect(page).to have_content @plant_3.name
    expect(page).to have_content @plant_4.name
    expect(page).not_to have_content @plant_2.name
  end

end
