class AddLinkNameToFlags < ActiveRecord::Migration[5.1]
  def change
    add_column :flags, :link_name, :string
  end
end
