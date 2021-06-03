class Api < ApplicationRecord
  has_many :positions, dependent: :destroy
  belongs_to :user
  validates :key, presence: true
  validates :secret_key, presence: true
  validates :exchange, presence: true
end
