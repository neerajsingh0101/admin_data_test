Given /^last user's age is nil$/ do
  #User.update_all('age = NULL', "id = #{User.last.id}")
end
