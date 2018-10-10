class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.string :email
      t.string :phone
      t.string :facebook
      t.string :instagram
      t.string :twitter
      t.string :linkedin

      t.timestamps
    end
  end
end
