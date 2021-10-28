class AddWeightToRounds < ActiveRecord::Migration[5.2]
  def change
      add_column :rounds, :weight, :text
  end
end
