class AddRankPointToTestEmail < ActiveRecord::Migration[5.1]
  def change
    add_column :test_emails, :rank_point, :float
  end
end
