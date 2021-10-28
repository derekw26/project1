class AddOrderToRounds < ActiveRecord::Migration[5.2]
  def change
    add_column :rounds, :order, :integer
  end
end
