class Card < ApplicationRecord
  belongs_to :phase
  has_many :fields, dependent: :destroy
  validates :id, uniqueness: true
end
