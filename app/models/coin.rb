class Coin < ApplicationRecord
  has_many :positions
  validates :title, presence: true, uniqueness: true
  validates :price, presence: true

  def quantity
    self.positions&.map(&:quantity).sum
  end
end
