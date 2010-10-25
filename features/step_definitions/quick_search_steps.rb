Then /^verify that use is John Smith$/ do
  selects =  page.find(:xpath, "//table[@id='view_table']")
  assert selects

  selects.find(:xpath, './tr/td[2]').text.should match Regexp.new('John')
  selects.find(:xpath, './tr/td[3]').text.should match Regexp.new('Smith')
end

Then /^first id of table should be the (.*) record of the table$/ do |position|
  page.should have_css("#view_table tr td a")
  case position
  when 'last'
      page.find("#view_table tr td a").text.should == User.last.id.to_s
  when 'second'
     page.find("#view_table tr td a").text.should == User.find(:all, :limit =>2)[1].id.to_s 
  when 'first'
     page.find("#view_table tr td a").text.should == User.first.id.to_s
  end
end

Then /^I should see following tabular attributes:$/ do |expected_cukes_table|
  expected_cukes_table.diff!(tableish('table.table tr', 'td,th'))
end
