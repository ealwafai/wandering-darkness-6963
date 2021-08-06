require 'rails_helper'

RSpec.describe 'Plots Index' do
  before :each do
    @garden = Garden.create!(name: "Community Garden", organic: true)

    @plot_1 = Plot.create!(number: 1, size: "Large", direction: "East", garden: @garden)
    @plot_2 = Plot.create!(number: 2, size: "small", direction: "West", garden: @garden)

    @plant_1 = Plant.create!(name: "Corn", description: "Yellow and sweet", days_to_harvest: 50)
    @plant_2 = Plant.create!(name: "Lettuce", description: "Great for salads", days_to_harvest: 75)
    @plant_3 = Plant.create!(name: "Broccoli", description: "Green", days_to_harvest: 100)
    @plant_4 = Plant.create!(name: "Asparagus", description: "Green", days_to_harvest: 125)
    @plant_5 = Plant.create!(name: "Potato", description: "Yellow", days_to_harvest: 150)
    @plant_6 = Plant.create!(name: "Tomato", description: "Red", days_to_harvest: 200)

    Crop.create!(plot: @plot_1, plant: @plant_1)
    Crop.create!(plot: @plot_1, plant: @plant_2)
    Crop.create!(plot: @plot_1, plant: @plant_3)
    Crop.create!(plot: @plot_2, plant: @plant_4)
    Crop.create!(plot: @plot_2, plant: @plant_5)
    Crop.create!(plot: @plot_2, plant: @plant_6)

    visit plots_path
  end

  it "displays a list of all plot numbers and plants names for each plot" do
#     User Story 1, Plots Index Page
# As a visitor
# When I visit the plots index page ('/plots')
# I see a list of all plot numbers
# And under each plot number I see names of all that plot's plants

    expect(page).to have_content("All Plots")

    within "#plot-#{@plot_1.id}" do
    expect(page).to have_content(@plot_1.number)

    expect(page).to have_content(@plant_1.name)
    expect(page).to have_content(@plant_2.name)
    expect(page).to have_content(@plant_3.name)
    end

    within "#plot-#{@plot_2.id}" do
    expect(page).to have_content(@plot_2.number)

    expect(page).to have_content(@plant_4.name)

    expect(page).to have_content(@plant_5.name)
    expect(page).to have_content(@plant_6.name)
    end
  end
end
