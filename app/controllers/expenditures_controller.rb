class ExpendituresController < ApplicationController

  def index
    @expenditures = Expenditure.all

    respond_to do |format|
      format.json { render :json => @expenditures }
    end
  end

  private

  def expenditure_params
    params.require(:expenditure).permit(:expense_id, :value, :date, :description)
  end

end
