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

  def self.import(file, event_id)
    CSV.foreach(file.path, headers: true) do |row|
      rec = row.to_hash
      
      if rec['name'].nil? || rec['name'].empty? || rec['horse'].nil? || rec['horse'].empty?
        next
      end
      r = {name: rec['name'], horse: rec['horse'], status: rec['status'], 
              dressage: rec['dressage'], xcountry: rec['xcountry'], event_id: event_id}
      Rider.create! r
    end
    true
  end
end
