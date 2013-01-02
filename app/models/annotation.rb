class Annotation < ActiveRecord::Base
  attr_accessible :comment, :length, :name, :position
end
