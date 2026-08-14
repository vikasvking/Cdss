class CreateHemms < ActiveRecord::Migration[8.1]
  def change
    create_table :hemms do |t|
      t.string :make
      t.string :model
      t.string :slno
      t.string :location

      t.timestamps
    end
  end
end
