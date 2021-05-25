class Portfolio < ApplicationRecord
  has_many :positions
  belongs_to :user
  validates :title, presence: true, uniqueness: true
end
