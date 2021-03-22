class ExpendituresController < ApplicationController
  def index
    @expenditures = Expenditure.fetch_expenditures(params[:user_id])

    render json: @expenditures, status: :ok
  end

  def create
    expenditure = Expenditure.new(expenditure_params)
    expenditures = Expenditure.fetch_expenditures(params[:user_id])

    if expenditure.save
      render json: expenditures, status: :ok
    else
      render json: expenditure.errors, status: :unprocessable_entity
    end
  end

  def destroy
    expenditures = Expenditure.destroy_expenditure(params[:id])

    render json: expenditures, status: :ok
  end

  private

  def expenditure_params
    params.require(:expenditure).permit(:expense_id, :value, :date, :description, :user_id)
  end

  def user_params
    params.require(:user).permit(:id)
  end
end
