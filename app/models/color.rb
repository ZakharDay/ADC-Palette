class Color < ApplicationRecord
  has_many :fills
  has_many :swatches, through: :fills
end
