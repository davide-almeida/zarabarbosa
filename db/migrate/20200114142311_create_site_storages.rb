class CreateSiteStorages < ActiveRecord::Migration[5.1]
  def change
    create_table :site_storages do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
