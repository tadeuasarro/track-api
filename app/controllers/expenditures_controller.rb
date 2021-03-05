class ExpendituresController < ApplicationController

  def index
    @expenditures = Expenditure.where("user_id = #{params[:user_id]}")

    respond_to do |format|
      format.json { render :json => @expenditures }
    end
  end

  def create
    expenditure = Expenditure.new(expenditure_params)

    respond_to do |format|
      if expenditure.save
        format.json { render :json => true }
      else
        format.json { render json: expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def expenditure_params
    params.require(:expenditure).permit(:expense_id, :value, :date, :description, :user_id)
  end

end
