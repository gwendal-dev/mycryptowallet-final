class Portfolio < ApplicationRecord
  has_many :positions, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
end
