FactoryBot.define do
  factory :score do
    top_of_first    { rand(10) }
    top_of_second   { rand(10) }
    top_of_third    { rand(10) }
    top_of_fourth   { rand(10) }
    top_of_fifth    { rand(10) }
    top_of_sixth    { rand(10) }
    top_of_seventh  { rand(10) }
    top_of_eighth   { rand(10) }
    top_of_ninth    { rand(10) }
    top_of_tenth    { rand(10) }
    top_of_eleventh { rand(10) }
    top_of_twelfth  { rand(10) }
    bottom_of_first    { rand(10) }
    bottom_of_second   { rand(10) }
    bottom_of_third    { rand(10) }
    bottom_of_fourth   { rand(10) }
    bottom_of_fifth    { rand(10) }
    bottom_of_sixth    { rand(10) }
    bottom_of_seventh  { rand(10) }
    bottom_of_eighth   { rand(10) }
    bottom_of_ninth    { rand(10) }
    bottom_of_tenth    { rand(10) }
    bottom_of_eleventh { rand(10) }
    bottom_of_twelfth  { rand(10) }
    association :game
  end
end
