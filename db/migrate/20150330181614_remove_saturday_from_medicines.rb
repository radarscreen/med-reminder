class RemoveSaturdayFromMedicines < ActiveRecord::Migration
  def change
    remove_column :medicines, :saturday, :string
  end
end
