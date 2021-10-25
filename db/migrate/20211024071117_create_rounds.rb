class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.integer :exercise_id
      t.integer :workout_id
      t.integer :sets
      t.integer :reps
      t.text :time

      t.timestamps
    end
  end
end
