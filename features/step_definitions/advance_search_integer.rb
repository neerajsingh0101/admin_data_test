Given /^last user's age is nil$/ do
  #User.update_all('age = NULL', "id = #{User.last.id}")
end

Then /^async I should see "(.*)"$/ do |msg|
  page.should have_content(msg)
end
