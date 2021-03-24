class AddCategoryToExpenditure < ActiveRecord::Migration[6.1]
  def change
    add_column :expenditures, :category, :integer
  end
end
