Then /^I should see crud show tabular attributes$/ do
  real_data = tableish('table.table tr', 'td,th').flatten
  real_data[0].should == "id"
  real_data[2].should == "first_name"
  real_data[3].should == "Mary"
  real_data[4].should == "last_name"
  real_data[5].should == "Jane"
  real_data[6].should == "age"
  real_data[7].should == "21"
  real_data[8].should == "data"
  real_data[9].should == "nil"
  real_data[10].should == "active"
  real_data[11].should == "false"
  real_data[12].should == "description"
  real_data[13].should == ""
  real_data[14].should == "born_at"
  real_data[15].should == ""
end

Then /^I should find value "(.*)" for "(.*)"$/ do |text, column|
  index = (column == 'created_at') ? 9 : 10
  page.find(:xpath, "//form//div[@class='data'][#{index}]").text.should match Regexp.new(text)
end

Then /^I should notice id of the last person$/ do
  page.should have_content("ID #{User.last.id}")
end

Then /^I should notice id of website of the last person$/ do
  page.should have_content("ID #{User.last.website.id}")
end
