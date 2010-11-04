#TODO try to use a table like utility
Then /^page should have link with text "(.*)" within "(.*)" and url "(.*)"$/ do |text, css_selector, url|
  id = css_selector[1..-1]
  page.should have_xpath( "//div[@id='#{id}']//a[@href='#{url}']", :text => text )
end

#TODO try to convert it into a utility so that name and url could be passed in the feature
Then /^I should see page with proper dropdown values$/ do
  selects =  page.find(:xpath, "//select[@class='drop_down_value_klass']")
  selects.should be_true

  selects.find(:xpath, './option[2]', :text => 'phone_number')

  selects.find(:xpath, './option[3]', :text => 'user')

  selects.find(:xpath, './option[4]', :text => 'website')

  url = '/admin_data/quick_search/'
  selects.find(:xpath, './option[2]').value.should match Regexp.new(url+'phone_number')

  selects.find(:xpath, './option[3]').value.should match Regexp.new(url+'user')
  
  selects.find(:xpath, './option[4]').value.should match Regexp.new(url+'website')
end
