class Alert < ApplicationRecord
  validates :coin, presence: true
  validates :value, presence: true
end
