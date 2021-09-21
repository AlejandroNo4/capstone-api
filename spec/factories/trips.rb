FactoryBot.define do
  factory :trip do
    destiny 'Paris'
    price '124.72'
    description 'test desc'
    days '2'
    hotel 'One'
    trip_type 'Flight'
  end
end
