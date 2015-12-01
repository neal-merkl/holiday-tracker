class Occurrence < ActiveRecord::Base
  belongs_to :day
  belongs_to :holiday
end
