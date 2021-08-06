class Plant < ApplicationRecord
  has_many :crops
  has_many :plots, through: :crops
  has_many :gardens, through: :plots
end
