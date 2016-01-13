class Movie < ActiveRecord::Base
  has_many :ebdmoviemaps
  has_many :ebds, :through => :ebdmoviemaps
end
