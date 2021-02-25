class AddSubscriptionToTestEmails < ActiveRecord::Migration[5.1]
  def change
    add_column :test_emails, :subscription, :boolean
  end
end
