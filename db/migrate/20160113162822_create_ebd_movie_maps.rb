class CreateEbdMovieMaps < ActiveRecord::Migration
  def change
    create_table :ebd_movie_maps do |t|
      t.string :description
      t.references :ebd, index: true, foreign_key: true
      t.references :movie, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
