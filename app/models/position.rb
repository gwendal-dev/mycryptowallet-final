class Position < ApplicationRecord
  belongs_to :portfolio
  belongs_to :coin
  validates :exchange, presence: true
  validates :entry_date, presence: true
  validates :quantity, presence: true, unless: ->(position){position.amount.presence?}
  validates :amount, presence: true, unless: ->(position){position.quantity.presence?}
end
