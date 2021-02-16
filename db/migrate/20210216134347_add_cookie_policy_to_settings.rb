class AddCookiePolicyToSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :cookie_policy, :text
  end
end
