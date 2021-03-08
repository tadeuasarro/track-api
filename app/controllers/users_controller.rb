class UsersController < ApplicationController

  def show
    @user = User.find_by(username: params[:id])

    respond_to do |format|
      format.json { render :json => @user }
    end
  end

  def create
    user = User.new(user_params)

    respond_to do |format|
      if user.save
        format.json { render :json => true }
      else
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    user = User.find(params[:id])
    user.target = params[:target]

    if user.target === 0
      user.expenditures.destroy_all
    end

    Rails.logger.debug params

    respond_to do |format|
      if user.save
        format.json { render :json => true }
      else
        format.json { render json: user.errors }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :target)
  end

end
