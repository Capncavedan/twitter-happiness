FactoryGirl.define do

  factory :city do
    name 'Indianapolis'

    factory :unhappy_city do
      name "Unhappyburg"
    end

    factory :average_city do
      name "Run-o-the-mill-ville"
    end

    factory :electric_city do
      name "Exciticity"
    end
  end

end