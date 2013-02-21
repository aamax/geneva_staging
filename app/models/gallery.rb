# == Schema Information
#
# Table name: galleries
#
#  id         :integer          not null, primary key
#  fname      :string(255)
#  category   :string(255)
#  thumbnail  :string(255)
#  caption    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Gallery < ActiveRecord::Base
  attr_accessible :fname, :category, :thumbnail, :caption, :image

  has_attached_file :image, :styles => { :full => "800x800>", :thumb => "100x100>" }

  scope "x_country", where("category = 'x_country'")
  scope "facility", where("category = 'facility'")
  scope "clinic_docs", where("category = 'clinic_docs'")
end
