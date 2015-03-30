class AddStartTimeToMedicines < ActiveRecord::Migration
  def change
    add_column :medicines, :start_time, :time
  end
end
