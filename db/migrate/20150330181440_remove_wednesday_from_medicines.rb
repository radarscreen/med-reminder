class RemoveWednesdayFromMedicines < ActiveRecord::Migration
  def change
    remove_column :medicines, :wednesday, :string
  end
end
