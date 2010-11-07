Then /^page should have text as current date for "(.*)"$/ do |css_selector|
  wait_until { page.evaluate_script("jQuery.active === 0") }

  page.find(css_selector).value.should == Time.now.strftime('%d-%B-%Y')
end

Then /^async verify that number of "(.*)" records is "(.*)"$/ do |klass, count|
  klass.constantize.count.should == count.to_i
end

Then /^async click "(.*)"$/ do |text|
  wait_until { page.evaluate_script("jQuery.active === 0") }

  page.evaluate_script('window.confirm = function() { return true; }')
  page.click_link_or_button(text)
end
    
Then /^asyc I should see "(.*)"$/ do |text|
  wait_until { page.evaluate_script("jQuery.active === 0") }

  page.should have_content(text)
end


Given /^first user's value for active is nil$/ do
  User.update_all('active = NULL', "id = #{User.first.id}")
end
Given /^last user's value for active is nil$/ do
  User.update_all('active = NULL', "id = #{User.last.id}")
end



Then /^async I should see "(.*)"$/ do |msg|
  page.should have_content(msg)
end

Then /^I should see only two rows in the table$/ do
  table =  page.find(:xpath, "//table[@id='advance_search_table']")
  table.find(:xpath, "./tbody/tr", :count => 2 )
end

Then /^page should have id "remove_row_3"$/ do
  page.has_css?("remove_row_3")
end
