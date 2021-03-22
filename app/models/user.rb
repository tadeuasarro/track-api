class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 4, maximum: 20 }
  validates :target, numericality: true, length: { minimum: 1 }

  has_many :expenditures

  def self.validate_user(params)
    user = User.new(params)
    return user unless user.valid?

    User.find_by(username: params[:id])
  end
end
