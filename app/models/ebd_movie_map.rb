class EbdMovieMap < ActiveRecord::Base
  belongs_to :ebd
  belongs_to :movie
end
