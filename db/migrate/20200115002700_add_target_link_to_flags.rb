class AddTargetLinkToFlags < ActiveRecord::Migration[5.1]
  def change
    add_column :flags, :target_link, :string
  end
end
