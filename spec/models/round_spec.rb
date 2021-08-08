# == Schema Information
#
# Table name: rounds
#
#  id         :bigint           not null, primary key
#  color      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Round, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
