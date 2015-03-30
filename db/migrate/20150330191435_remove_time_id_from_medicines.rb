class RemoveTimeIdFromMedicines < ActiveRecord::Migration
  def change
    remove_column :medicines, :time_id, :integer
  end
end
