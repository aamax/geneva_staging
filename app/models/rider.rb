# == Schema Information
#
# Table name: riders
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  name       :string(255)
#  horse      :string(255)
#  status     :text
#  dressage   :string(255)
#  xcountry   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rider < ActiveRecord::Base
  attr_accessible :dressage, :event_id, :horse, :name, :status, :xcountry

  belongs_to :event
end
