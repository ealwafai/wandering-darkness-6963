require 'rails_helper'

RSpec.describe 'Garden show page' do
  before :each do
    @garden = Garden.create!(name: "Savage Garden", organic: true)

    @plot_1 = Plot.create!(number: 1, size: "Large", direction: "East", garden: @garden)
    @plot_2 = Plot.create!(number: 2, size: "small", direction: "West", garden: @garden)

    @plant_1 = Plant.create!(name: "Corn", description: "Yellow and sweet", days_to_harvest: 50)
    @plant_2 = Plant.create!(name: "Lettuce", description: "Great for salads", days_to_harvest: 75)
    @plant_3 = Plant.create!(name: "Broccoli", description: "Green", days_to_harvest: 120)

    Crop.create!(plot: @plot_1, plant: @plant_1)
    Crop.create!(plot: @plot_1, plant: @plant_2)
    Crop.create!(plot: @plot_2, plant: @plant_2)
    Crop.create!(plot: @plot_2, plant: @plant_3)

    visit garden_path(@garden)
  end

  it "displays a list of unique plants that take less than 100 days to harvest that are included in that garden plots" do
#     User Story 3, Garden's Plants
# As a visitor
# When I visit an garden's show page
# Then I see a list of plants that are included in that garden's plots
# And I see that this list is unique (no duplicate plants)
# And I see that this list only includes plants that take less than 100 days to harvest

    expect(page).to have_content(@plant_1.name)
    expect(page).to have_content(@plant_2.name)
    expect(page).to_not have_content(@plant_3.name)
  end
end
