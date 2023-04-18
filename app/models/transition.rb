class Transition < ApplicationRecord
  validates :valor, :tipo, presence: true
  validates :nome, length: {in: 0..20}
  belongs_to :user
end
