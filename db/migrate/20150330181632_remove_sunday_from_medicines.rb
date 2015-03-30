class RemoveSundayFromMedicines < ActiveRecord::Migration
  def change
    remove_column :medicines, :sunday, :string
  end
end
