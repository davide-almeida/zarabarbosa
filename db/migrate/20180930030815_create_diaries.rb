class CreateDiaries < ActiveRecord::Migration[5.1]
  def change
    create_table :diaries do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :week
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
