class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:id])

    respond_to do |format|
      format.json { render json: @user }
      format.html { render html: @user }
    end
  end

  def create
    user = User.new(user_params)

    respond_to do |format|
      if user.save
        format.json { render json: true }
        format.html { render html: true }
      else
        format.json { render json: user.errors, status: :unprocessable_entity }
        format.html { render html: user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    user = User.find(params[:id])
    user.target = params[:target]

    # rubocop:disable Style/NumericPredicate
    user.expenditures.destroy_all if user.target == 0
    # rubocop:enable Style/NumericPredicate

    respond_to do |format|
      if user.save
        format.json { render json: true }
        format.html { render html: true }
      else
        format.json { render json: user.errors }
        format.html { render html: user.errors }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :target)
  end
end
