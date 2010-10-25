Then /^verify that user is John Smith$/ do
  selects =  page.find(:xpath, "//table[@id='view_table']")
  assert selects

  selects.find(:xpath, './tr/td[2]').text.should match Regexp.new('John')
  selects.find(:xpath, './tr/td[3]').text.should match Regexp.new('Smith')
end

Then /^I should see following tabular attributes:$/ do |expected_cukes_table|
  expected_cukes_table.diff!(tableish('table.table tr', 'td,th'))
end

Then /^first id of table should be of "(.*)"$/ do |first_name|
  page.should have_css("#view_table tr td a")
  page.find("#view_table tr td a").text.should == User.find_by_first_name(first_name).id.to_s
end
