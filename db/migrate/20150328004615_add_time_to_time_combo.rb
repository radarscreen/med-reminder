class AddTimeToTimeCombo < ActiveRecord::Migration
  def change
    add_column :time_combos, :time, :string
  end
end
