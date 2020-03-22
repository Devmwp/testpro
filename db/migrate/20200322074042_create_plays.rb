class CreatePlays < ActiveRecord::Migration[6.0]
  def change
    create_table :plays do |t|
      t.integer :tick
      t.references :photo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
