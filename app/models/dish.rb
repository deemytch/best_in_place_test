class Dish < ActiveRecord::Base
  belongs_to :cuisine, :inverse_of => :dishes
end
