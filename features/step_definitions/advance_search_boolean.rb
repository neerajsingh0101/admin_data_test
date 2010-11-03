Given /^last user's value for active is nil$/ do
  User.update_all('active = NULL', "id = #{User.last.id}")
end
