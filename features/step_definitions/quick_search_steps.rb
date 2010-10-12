Then /^verify that use is John Smith$/ do
  selects =  page.find(:xpath, "//table[@id='view_table']")
  assert selects

  assert_match 'John', selects.find(:xpath, './tr/td[2]').text
  assert_match 'Smith', selects.find(:xpath, './tr/td[3]').text
end

Then /^first id of table should be the (.*) record of the table$/ do |position|
  page.should have_css("#view_table tr td a")
  if position == 'last'
    assert_equal User.last.id.to_s, page.find("#view_table tr td a").text
  elsif position == 'second'
    assert_equal User.find(:all, :limit =>2)[1].id.to_s, page.find("#view_table tr td a").text
  elsif position == 'first'
    assert_equal User.first.id.to_s, page.find("#view_table tr td a").text
  end
end

Then /^I should see following tabular attributes:$/ do |expected_cukes_table|
  expected_cukes_table.diff!(tableish('table.table tr', 'td,th'))
end
