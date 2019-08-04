class AddHeaderToSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :header, :text
  end
end
