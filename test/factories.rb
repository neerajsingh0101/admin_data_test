Factory.define :user do |f|
  f.first_name 'Mary'
  f.last_name 'Jane'
  f.age 21
end

Factory.define :website do |f|
  f.url 'http://example.com'
  f.association :user
end

Factory.define :phone_number do |f|
  f.number '123-456-7890'
  f.association :user
end
