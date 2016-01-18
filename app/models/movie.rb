class Movie < ActiveRecord::Base
  has_many :ebdMovieMaps
  has_many :ebds, :through => :ebdMovieMaps
  validates_uniqueness_of :imdb_id
end
