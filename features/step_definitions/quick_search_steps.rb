Then /^(.*)verify that user "(.*)" is "(.*)"$/ do |async, attribute, input|
  wait_until { page.evaluate_script("jQuery.active === 0") } unless async.blank?

  table =  page.find(:xpath, "//table[@id='view_table']")
  table.should be_true

  counter = attribute == 'first_name' ? 2 : 3

  if async.blank?
    table.find(:xpath, "./tr/td[#{counter}]").text.should match Regexp.new(input)
  else
    table.find(:xpath, "./tbody/tr/td[#{counter}]").text.should match Regexp.new(input)
  end
end

Then /^I should see following tabular attributes:$/ do |expected_cukes_table|
  expected_cukes_table.diff!(tableish('table.table tr', 'td,th'))
end

Then /^first id of table should be of "(.*)"$/ do |first_name|
  page.should have_css("#view_table tr td a")
  page.find("#view_table tr td a").text.should == User.find_by_first_name(first_name).id.to_s
end
