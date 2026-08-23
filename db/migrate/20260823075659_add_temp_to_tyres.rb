class AddTempToTyres < ActiveRecord::Migration[8.1]
  def change
    add_column :tyres, :temp, :integer
  end
end
