class Goal < ApplicationRecord
  validates :valor, presence: true
  validates :nome, presence: true
  belongs_to :user
end
