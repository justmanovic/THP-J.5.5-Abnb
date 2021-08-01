Rental.destroy_all
Accomodation.destroy_all
Town.destroy_all
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('rentals')
ActiveRecord::Base.connection.reset_pk_sequence!('accomodations')
ActiveRecord::Base.connection.reset_pk_sequence!('towns')
ActiveRecord::Base.connection.reset_pk_sequence!('users')

town_zip = [["Paris","75000"],["Lyon","69000"],["Marseille","13000"],["Nice","06000"],["Bordeaux","33000"],["Strasbourg","67000"],["Rennes","35000"],["Toulouse","31000"],["Caen","14000"],["Toulon","83000"]]

20.times do
    User.create(email:Faker::Internet.email , phone_number:'0667557652' , description:Faker::Lorem.sentences(number: 1).join)
    # User.create(email:Faker::Internet.email , phone_number:'0667557652' , description:Faker::Lorem.sentences(number: 1).join)
end

10.times do |i|
    Town.create(name:town_zip[i][0], zip_code:town_zip[i][1])
end

3   .times do
    Accomodation.create(available_beds:rand(1..4),price_per_night:rand(80..300),description:Faker::Lorem.sentences(number: 4),has_wifi:[true, true, true, false][rand(0..3)], welcome_message:Faker::Lorem.sentences(number: 6),town_id:rand(1..Town.count), host_id:rand(1..User.count))
end

10000.times do
    start_past = Faker::Date.between(from: '2014-01-01', to: '2014-02-28')
    # start_future = Faker::Date.between(from: '2021-08-01', to: '2021-12-31')
    Rental.create(start_date:start_past, end_date:start_past+rand(1..2), accomodation_id:rand(1..Accomodation.count), guest_id:rand(1..User.count))
    # Rental.create(start_date:start_future, end_date:start_future+rand(1..20), accomodation_id:rand(1..Accomodation.count), guest_id:rand(1..User.count))
  end