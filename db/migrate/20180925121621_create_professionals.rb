class CreateProfessionals < ActiveRecord::Migration[5.1]
  def change
    create_table :professionals do |t|
      t.string :name
      t.text :title
      t.string :number
      t.text :description
      t.string :phone

      t.timestamps
    end
  end
end
