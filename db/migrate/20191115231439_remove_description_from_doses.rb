class RemoveDescriptionFromDoses < ActiveRecord::Migration[5.2]
  def change
    remove_column :doses, :description, :string
  end
end
