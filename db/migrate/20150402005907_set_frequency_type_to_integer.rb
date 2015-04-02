class SetFrequencyTypeToInteger < ActiveRecord::Migration
  def change
  	remove_column :medicines, :frequency
  	add_column :medicines, :frequency, :integer
  end
end
