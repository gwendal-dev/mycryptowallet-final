class Coin < ApplicationRecord
  has_many :positions
  validates :title, presence: true, uniqueness: true
  validates :price, presence: true

  def sum(portfolio_id)
    sum = 0
    arr = self.positions.where(portfolio_id: portfolio_id)&.map(&:quantity)
    arr.each do |quantity|
      if quantity != nil
        sum += quantity
      end
    end
    return sum
  end

end
