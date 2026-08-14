class CreateDumpers < ActiveRecord::Migration[8.1]
  def change
    create_table :dumpers do |t|
      t.string :name
      t.string :project
      t.string :slno

      t.timestamps
    end
  end
end
