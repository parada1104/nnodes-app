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
class Player < ApplicationRecord
  ##associations
  has_many :bets , dependent: :destroy
  has_many :rounds, through: :bets
  accepts_nested_attributes_for :bets

  ##monetize
  monetize :balance_cents, as: :balance

  ##validations
  validates :name, presence: true
  validates :lastName, presence: true
  validates :balance, numericality: true
end
