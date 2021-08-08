# == Schema Information
#
# Table name: players
#
#  id               :bigint           not null, primary key
#  name             :string           not null
#  lastName         :string           not null
#  balance_cents    :integer          default(1000000), not null
#  balance_currency :string           default("CLP"), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'rails_helper'

RSpec.describe Player, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
