# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160113162822) do

  create_table "ebd_movie_maps", force: :cascade do |t|
    t.string   "description"
    t.integer  "ebd_id"
    t.integer  "movie_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "ebd_movie_maps", ["ebd_id"], name: "index_ebd_movie_maps_on_ebd_id"
  add_index "ebd_movie_maps", ["movie_id"], name: "index_ebd_movie_maps_on_movie_id"

  create_table "ebds", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "wikipedia_url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string   "name"
    t.string   "plot"
    t.string   "plot_outline"
    t.string   "tagline"
    t.string   "rating_votes"
    t.string   "rating"
    t.string   "writers"
    t.string   "year_released"
    t.string   "thumbnails"
    t.string   "imdb_id"
    t.string   "sortable_formatted_title"
    t.string   "runtime"
    t.string   "mpaa_rating"
    t.string   "genre"
    t.string   "director"
    t.string   "original_title"
    t.string   "studio"
    t.string   "trailer_url"
    t.string   "country"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
