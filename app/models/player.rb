# == Schema Information
#
# Table name: players
#
#  id               :bigint           not null, primary key
#  name             :string           not null
#  last_name        :string           not null
#  balance_cents    :integer          default(1000000), not null
#  balance_currency :string           default("CLP"), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  status           :integer          default("active"), not null
#
class Player < ApplicationRecord
  enum status: {inactive: 0, active: 1}

  scope :active_players, -> { where(status: :active) }

  ##associations
  has_many :bets , dependent: :destroy
  has_many :rounds, through: :bets
  accepts_nested_attributes_for :bets

  ##monetize
  monetize :balance_cents, as: :balance

  ##validations
  validates :name, presence: true
  validates :last_name, presence: true
  validates :balance, numericality: true

  def full_name
    "#{self.name} #{self.last_name}"
  end
end
