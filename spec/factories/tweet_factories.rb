FactoryGirl.define do

  factory :tweet do
    content 'I am making eggs and bacon for breakfast'
    happiness 50

    factory :unhappy_tweet do
      content 'I do not want to go to work today'
      happiness 30
    end

    factory :very_unhappy_tweet do
      content 'I would rather pull my nails out than go on this blind date'
      happiness 10
    end

    factory :happy_tweet do
      content "Delicious lunch at Django today"
      happiness 70
    end

    factory :perfectly_happy_tweet do
      content "Found my missing dog! He had a winning lottery ticket stuck to him! Also I lost 30 pounds today!"
      happiness 100
    end
  end

end