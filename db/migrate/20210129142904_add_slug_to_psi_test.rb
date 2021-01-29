class AddSlugToPsiTest < ActiveRecord::Migration[5.1]
  def change
    add_column :psi_tests, :slug, :string
    add_index :psi_tests, :slug, unique: true
  end
end
