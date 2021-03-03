class ExpensesController < ApplicationController

  def index
    @expenses = Expense.all

    Rails.logger.debug @expenses.last.name

    respond_to do |format|
      format.json { render :json => @expenses }
    end
  end

  def create
    expense = Expense.new(expense_params)

    respond_to do |format|
      if expense.save
        format.html { redirect_to expense, notice: 'Todo successfully created!' }
        format.json { render :index, status: :created, location: expense }
      else
        format.html { render :new }
        format.json { render json: expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @expense = Expense.find(3)

    respond_to do |format|
      format.html
      format.json { render :json => @expense }
    end

  end

  private

  def expense_params
    params.require(:expense).permit(:name)
  end

end
