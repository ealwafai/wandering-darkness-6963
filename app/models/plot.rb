class Plot < ApplicationRecord
  belongs_to :garden
  has_many :crops
  has_many :plants, through: :crops
end
