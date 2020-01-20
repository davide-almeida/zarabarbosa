class AddLinkFlagToFlags < ActiveRecord::Migration[5.1]
  def change
    add_column :flags, :link_flag, :string
  end
end
