class AddIsActiveToFlags < ActiveRecord::Migration[5.1]
  def change
    add_column :flags, :is_active, :string
  end
end
