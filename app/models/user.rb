class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 4, maximum: 20 }
  validates :target, numericality: true, length: { minimum: 1 }

  has_many :expenditures

  def self.validate_user(param)
    user = User.find_by(username: param)

    return { user: user, token: JWT.encode(user[:username], nil, 'none') } if user
  end
end
