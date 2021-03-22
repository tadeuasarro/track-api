class UsersController < ApplicationController
  def show
    user = User.find_by(username: params[:id])

    if user
      render json: user.to_json(include: :expenditures), status: :ok
    else
      render json: user, status: :not_found
    end
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user.to_json(include: :expenditures), status: :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    user.target = params[:target]

    # rubocop:disable Style/NumericPredicate
    user.expenditures.destroy_all if user.target == 0
    # rubocop:enable Style/NumericPredicate

    if user.save
      render json: user.to_json(include: :expenditures), status: :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :target)
  end
end
