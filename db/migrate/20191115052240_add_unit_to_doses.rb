class AddUnitToDoses < ActiveRecord::Migration[5.2]
  def change
    add_column :doses, :unit, :string
  end
end
