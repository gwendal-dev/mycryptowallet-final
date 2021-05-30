class Coin < ApplicationRecord
  has_many :positions
  validates :title, presence: true, uniqueness: true
  validates :price, presence: true

  def sum(portfolio_id)
    self.positions.where(portfolio_id: portfolio_id)&.map(&:quantity).sum
  end

end
