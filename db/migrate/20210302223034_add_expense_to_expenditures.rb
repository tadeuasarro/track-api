class AddExpenseToExpenditures < ActiveRecord::Migration[6.1]
  def change
    add_column :expenditures, :expense_id, :integer
  end
end
