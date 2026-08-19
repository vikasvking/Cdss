class CreateTyres < ActiveRecord::Migration[8.1]
  def change
    create_table :tyres do |t|
      t.references :hemm, null: false, foreign_key: true
      t.string :position
      t.decimal :pressure
      t.string :sensor_id
      t.boolean :active

      t.timestamps
    end
  end
end
