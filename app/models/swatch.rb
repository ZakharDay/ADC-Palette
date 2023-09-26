class Swatch < ApplicationRecord
  belongs_to :project
  has_many :fills
  has_many :colors, through: :fills
end
