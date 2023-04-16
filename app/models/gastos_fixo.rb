class GastosFixo < ApplicationRecord
  validates :valor, numericality: true

  belongs_to :user
end
