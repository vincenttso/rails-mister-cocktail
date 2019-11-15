class AddMeasurementToDoses < ActiveRecord::Migration[5.2]
  def change
    add_column :doses, :measurement, :integer
  end
end
