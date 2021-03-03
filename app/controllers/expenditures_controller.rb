class ExpendituresController < ApplicationController

  def index
    @expenditures = Expenditure.all

    respond_to do |format|
      format.html
      format.json { render :json => @expenditures }
    end
  end

  def show
    @expenditure = Expenditure.find(params[:id])
  end

  def create
    expenditure = Expenditure.new(expenditure_params)

    Rails.logger.debug params
  end

  def update
    expenditure = Expenditure.find(params[:id])
  end

  def destroy
    expenditure = Expenditure.find(params[:id])
  end

  private

  def expenditure_params
    params.require(:expenditure).permit(:expense_id, :value, :date, :description)
  end

end
