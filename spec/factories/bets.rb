FactoryBot.define do
  factory :bet do
    player { nil }
    round { nil }
    betColor { 1 }
    betAmount { "" }
    prizeAmount { "" }
  end
end
