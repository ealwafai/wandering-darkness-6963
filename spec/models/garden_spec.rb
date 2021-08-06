require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
    it { should have_many(:plants).through(:plots) }
  end

  describe 'instance methods' do
    describe '#unique_plants_under_100_days' do
      it 'returns unique plants that take less than 100 days to harvest' do
        garden = Garden.create!(name: "Savage Garden", organic: true)

        plot_1 = Plot.create!(number: 1, size: "Large", direction: "East", garden: garden)
        plot_2 = Plot.create!(number: 2, size: "small", direction: "West", garden: garden)

        plant_1 = Plant.create!(name: "Corn", description: "Yellow and sweet", days_to_harvest: 50)
        plant_2 = Plant.create!(name: "Lettuce", description: "Great for salads", days_to_harvest: 75)
        plant_3 = Plant.create!(name: "Broccoli", description: "Green", days_to_harvest: 120)

        Crop.create!(plot: plot_1, plant: plant_1)
        Crop.create!(plot: plot_1, plant: plant_2)
        Crop.create!(plot: plot_1, plant: plant_3)
        Crop.create!(plot: plot_2, plant: plant_2)
        Crop.create!(plot: plot_2, plant: plant_3)

        expect(garden.unique_plants_under_100_days).to eq([plant_1, plant_2])
      end
    end
  end
end
