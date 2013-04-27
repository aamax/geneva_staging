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

require 'spec_helper'

describe Rider do
  pending "add some examples to (or delete) #{__FILE__}"
end
