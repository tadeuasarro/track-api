class AddTargetToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :target, :float
  end
end
