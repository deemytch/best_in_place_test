class Cuisine < ActiveRecord::Base
  has_many :dishes, :inverse_of => :cuisine
end
