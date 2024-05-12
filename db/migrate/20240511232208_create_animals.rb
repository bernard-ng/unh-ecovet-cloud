class CreateAnimals < ActiveRecord::Migration[7.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :race
      t.date :birth_at
      t.float :weight
      t.integer :encoded_race
      t.string :gender
      t.references :farm, null: false, foreign_key: true

      t.timestamps
    end
  end
end
