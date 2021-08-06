class Plant < ApplicationRecord
  has_many :crops
  has_many :plots, through: :crops
end
