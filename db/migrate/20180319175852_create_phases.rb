class CreatePhases < ActiveRecord::Migration[5.1]
  def change
    create_table :phases do |t|
      t.string :name
      t.string :description
      t.boolean :done
      t.references :pipe, foreign_key: true

      t.timestamps
    end
  end
end
