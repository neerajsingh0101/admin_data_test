Then /^I should see crud show tabular attributes$/ do
  real_data = tableish('table.table tr', 'td,th').flatten
  assert_equal "id", real_data[0]
  assert_equal "first_name", real_data[2]
  assert_equal "Mary", real_data[3]
  assert_equal "last_name", real_data[4]
  assert_equal "Jane", real_data[5]
  assert_equal "age", real_data[6]
  assert_equal "21", real_data[7]
  assert_equal "data", real_data[8]
  assert_equal "nil", real_data[9]
  assert_equal "active", real_data[10]
  assert_equal "false", real_data[11]
  assert_equal "description", real_data[12]
  assert_equal "", real_data[13]
  assert_equal "born_at", real_data[14]
  assert_equal "", real_data[15]
end

Then /^I should find value "(.*)" for "(.*)"$/ do |text, column|
  index = (column == 'created_at') ? 9 : 10
  assert_match text, page.find(:xpath, "//form//div[@class='data'][#{index}]").text
end

Then /^I should notice id of the last person$/ do
  u = User.last
  page.should have_content("ID #{u.id}")
end

Then /^I should notice id of website of the last person$/ do
  u = User.last
  website = User.last.website
  page.should have_content("ID #{website.id}")
end
