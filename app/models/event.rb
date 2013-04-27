# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  category      :string(255)
#  name          :string(255)
#  date_and_time :datetime
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Event < ActiveRecord::Base
  attr_accessible :category, :name, :date_and_time, :description

  scope "clinics", where("category = 'clinic'").order(:date_and_time)
  scope "schooling", where("category = 'schooling'").order(:date_and_time)
  scope "outside", where("category = 'outside'").order(:date_and_time)

  has_many :riders
end
