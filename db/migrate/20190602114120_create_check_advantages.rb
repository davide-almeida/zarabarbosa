class CreateCheckAdvantages < ActiveRecord::Migration[5.1]
  def change
    create_table :check_advantages do |t|
      t.string :video
      t.string :e_book
      t.string :work_book
      t.string :meditation
      t.string :conference
      t.string :member
      t.string :access_life
      t.string :assurance
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
