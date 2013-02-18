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

require 'spec_helper'

describe Gallery do
  pending "add some examples to (or delete) #{__FILE__}"
end
