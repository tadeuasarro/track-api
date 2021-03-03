class UsersController < ApplicationController

  def show
    @user = User.find_by(username: params[:id])

    Rails.logger.debug params

    respond_to do |format|
      format.json { render :json => @user }
    end
  end

end
