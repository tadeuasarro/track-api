class Expenditure < ApplicationRecord
  validates :value, presence: true, numericality: true

  validates :description, presence: true, length: { minimum: 10, maximum: 100 }

  validates :date, presence: true, length: { is: 10 }

  belongs_to :expense
  belongs_to :user
end
