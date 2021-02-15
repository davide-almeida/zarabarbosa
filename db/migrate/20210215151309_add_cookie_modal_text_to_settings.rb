class AddCookieModalTextToSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :cookie_modal_text, :text
  end
end
