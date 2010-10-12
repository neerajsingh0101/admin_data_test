User.delete_all
PhoneNumber.delete_all
Website.delete_all


(1..100).to_a.each_with_index do |i,e|
  User.create!(:data => {:year => 1900 + i, :music => 'rock, jazz'}, 
               :first_name => Faker::Name.first_name, 
               :last_name => Faker::Name.last_name, 
               :active => true, 
               :age => 1 + i,
               :description => Faker::Lorem.paragraph,
               :born_at =>  Time.now)
end

User.find(:all).each do |u|
  PhoneNumber.create!(:number => Faker::PhoneNumber.phone_number, :user_id => u.id)
  PhoneNumber.create!(:number => Faker::PhoneNumber.phone_number, :user_id => u.id)
  Website.create!(:url => 'http://www.' + Faker::Internet.domain_name, :user_id => u.id)
end

