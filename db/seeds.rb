# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  @garden = Garden.create!(name: "Sunshine Gardens", organic: true)
  @plot_1 = @garden.plots.create!(number: 10, size: "Big", direction: "East")
  @plot_2 = @garden.plots.create!(number: 20, size: "small", direction: "West")
  @plant_2 = @plot_1.plants.create!(name: 'Pumpkin', description: 'Orange', days_to_harvest: 180)
  @plant_3 = @plot_2.plants.create!(name: 'Apricot', description: 'Yellow', days_to_harvest: 50)
  @plant_4 = @plot_2.plants.create!(name: 'Blueberry', description: 'Blue', days_to_harvest: 90)
  @plant_1 = Plant.create!(name: 'Ivy', description: 'An ivy plant', days_to_harvest: 90)
  @growing_plant_1 = GrowingPlant.create!(plot: @plot_1, plant: @plant_1)
  @growing_plant_2 = GrowingPlant.create!(plot: @plot_2, plant: @plant_1)
