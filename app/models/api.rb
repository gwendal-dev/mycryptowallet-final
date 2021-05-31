class Api < ApplicationRecord
  validates :key, presence: true
  validates :secret_key, presence: true
  validates :exchange, presence: true
end
