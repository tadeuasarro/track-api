class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 4, maximum: 20 }

  validates :target, numericality: true, length: { minimum: 1 }

  has_many :expenditures
end
