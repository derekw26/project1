class AddOrderToRounds < ActiveRecord::Migration[5.2]
  def change
    add column :rounds, :order, :integer
  end
end
