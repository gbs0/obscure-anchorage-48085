class CreateAnswears < ActiveRecord::Migration[6.1]
  def change
    create_table :answears do |t|
      t.string :description
      t.references :question, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6

      t.timestamps
    end
  end
end
