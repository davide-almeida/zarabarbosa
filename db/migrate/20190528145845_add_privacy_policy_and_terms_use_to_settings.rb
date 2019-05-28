class AddPrivacyPolicyAndTermsUseToSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :privacy_policy, :text
    add_column :settings, :terms_use, :text
  end
end
