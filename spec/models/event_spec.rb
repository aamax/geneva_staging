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

require 'spec_helper'

describe Event do
  pending "add some examples to (or delete) #{__FILE__}"
end
