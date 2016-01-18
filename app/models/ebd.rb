class Ebd < ActiveRecord::Base
  has_many :ebdMovieMaps
  has_many :movies, :through => :ebdMovieMaps

  validates_uniqueness_of :name
end
