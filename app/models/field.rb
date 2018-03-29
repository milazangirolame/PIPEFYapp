class Field < ApplicationRecord
  belongs_to :card
  validates :id, uniqueness: true
end
