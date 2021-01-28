class AddDescriptionToPsiTests < ActiveRecord::Migration[5.1]
  def change
    add_column :psi_tests, :description, :text
  end
end
