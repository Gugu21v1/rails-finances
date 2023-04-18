class RendaFixa < ApplicationRecord
  validates :valor, presence: true
  validates :data, numericality: { in: 1..28 }, presence: true
  validates :nome, presence: true, uniqueness: true
  belongs_to :user
end
