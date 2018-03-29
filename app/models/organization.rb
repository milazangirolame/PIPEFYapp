class Organization < ApplicationRecord

  has_many :pipes, dependent: :destroy
  has_many :phases, through: :pipes
  has_many :cards, through: :phases
  has_many :fields, through: :cards
  validates :id, uniqueness: true


end
