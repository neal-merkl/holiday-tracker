class Day < ActiveRecord::Base
  has_many :occurrences
  has_many :holidays, through: :occurrences
end
