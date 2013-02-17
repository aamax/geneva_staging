class Gallery < ActiveRecord::Base
  attr_accessible :fname, :category, :thumbnail, :caption

  scope "x_country", where("category = 'x_country'")
end
