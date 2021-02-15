class AddCookieActiveToSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :cookie_active, :integer
  end
end
