class UsersController < ApplicationController
  def show
    user = User.find_by(username: params[:id])

    render json: user, status: :ok
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: true, status: :ok
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
      render json: true
    else
      render json: user.errors
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :target)
  end
end
