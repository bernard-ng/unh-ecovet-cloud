class CreateFarms < ActiveRecord::Migration[7.1]
  def change
    create_table :farms do |t|
      t.string :name
      t.string :address
      t.float :area
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
