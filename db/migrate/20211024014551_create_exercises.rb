class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.text :name
      t.text :equipment
      t.text :body_part
      t.text :description
      t.text :video
      t.text :image

      t.timestamps
    end
  end
end
