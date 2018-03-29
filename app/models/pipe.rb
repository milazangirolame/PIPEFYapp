class Pipe < ApplicationRecord
  belongs_to :organization
  has_many :phases, dependent: :destroy
  has_many :cards, through: :phases
  has_many :fields, through: :cards
  validates :id, uniqueness: true
end
