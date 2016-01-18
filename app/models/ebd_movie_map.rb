class EbdMovieMap < ActiveRecord::Base
  belongs_to :ebd
  belongs_to :movie
  validates_uniqueness_of :movie_id, scope: :ebd_id
end
