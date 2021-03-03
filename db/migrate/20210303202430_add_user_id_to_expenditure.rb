class AddUserIdToExpenditure < ActiveRecord::Migration[6.1]
  def change
    add_column :expenditures, :user_id, :integer
  end
end
