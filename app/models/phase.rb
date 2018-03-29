class Phase < ApplicationRecord
  belongs_to :pipe
  has_many :cards, dependent: :destroy
  has_many :fields, through: :cards
  validates :id, uniqueness: true

end
