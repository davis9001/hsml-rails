class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :plot
      t.string :plot_outline
      t.string :tagline
      t.string :rating_votes
      t.string :rating
      t.string :writers
      t.string :year_released
      t.string :thumbnails
      t.string :imdb_id
      t.string :sortable_formatted_title
      t.string :runtime
      t.string :mpaa_rating
      t.string :genre
      t.string :director
      t.string :original_title
      t.string :studio
      t.string :trailer_url
      t.string :country

      t.timestamps null: false
    end
  end
end
