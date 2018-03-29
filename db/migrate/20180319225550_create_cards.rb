class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :title
      t.datetime :due_date
      t.references :phase, foreign_key: true

      t.timestamps
    end
  end
end
