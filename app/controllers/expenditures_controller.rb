class ExpendituresController < ApplicationController
  def index
    @expenditures = Expenditure.where("user_id = #{params[:user_id]}").order('date DESC')

    respond_to do |format|
      format.json { render json: @expenditures }
      format.html { render html: @expenditures }
    end
  end

  def create
    expenditure = Expenditure.new(expenditure_params)

    respond_to do |format|
      if expenditure.save
        format.json { render json: true }
        format.html { render html: true }
      else
        format.json { render json: expenditure.errors }
        format.html { render html: expenditure }
      end
    end
  end

  def destroy
    expenditure = Expenditure.find(params[:id])
    expenditure.destroy

    respond_to do |format|
      format.json { render json: true }
    end
  end

  private

  def expenditure_params
    params.require(:expenditure).permit(:expense_id, :value, :date, :description, :user_id)
  end
end
