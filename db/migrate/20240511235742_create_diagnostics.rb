class CreateDiagnostics < ActiveRecord::Migration[7.1]
  def change
    create_table :diagnostics do |t|
      t.references :animal, null: false, foreign_key: true
      t.string :symptoms
      t.string :predictions

      t.timestamps
    end
  end
end
