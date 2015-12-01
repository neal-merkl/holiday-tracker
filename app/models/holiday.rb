class Holiday < ActiveRecord::Base
  has_many :occurrences
  has_many :days, through: :occurrences
end
