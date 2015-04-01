class RemoveQuantityFromMedicines < ActiveRecord::Migration
  def change
    remove_column :medicines, :quantity, :integer
  end
end
