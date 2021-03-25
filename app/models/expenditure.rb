class Expenditure < ApplicationRecord
  validates :value, presence: true, numericality: true
  validates :description, presence: true, length: { minimum: 10, maximum: 100 }
  validates :date, presence: true, length: { is: 10 }
  validates :category, presence: true

  belongs_to :user

  def self.fetch_expenditures(user_id)
    Expenditure.where('user_id = ?', user_id).order('date DESC')
  end
end
