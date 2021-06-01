class Api < ApplicationRecord
  has_many :positions, dependent: :destroy

  validates :key, presence: true
  validates :secret_key, presence: true
  validates :exchange, presence: true
end
