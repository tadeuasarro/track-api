class Expenditure < ApplicationRecord
  validates :value, presence: true, numericality: true

  validates :description, presence: true, length: { minimum: 10, maximum: 100 }

  validates :date, presence: true, length: { is: 10 }

  validates :expense_id, presence: true

  belongs_to :user

  def self.fetch_expenditures user_id
    User.find(user_id).expenditures.order('date DESC')
  end
end
