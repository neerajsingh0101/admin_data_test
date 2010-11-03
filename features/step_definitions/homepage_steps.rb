Then /^page should have link with text "(.*)" within "(.*)" and url "(.*)"$/ do |text, css_selector, url|
  tmp = css_selector[1..-1]
  page.find(:xpath, "//div[@id='#{tmp}']//a[@href='#{url}']").text.should == text
end

Then /^I should see page with proper dropdown values$/ do
  selects =  page.find(:xpath, "//select[@class='drop_down_value_klass']")
  selects.should be_true

  selects.find(:xpath, './option[2]').text.should == 'phone_number'

  selects.find(:xpath, './option[3]').text.should == 'user'

  selects.find(:xpath, './option[4]').text.should == 'website'

  url = '/admin_data/quick_search/'
  selects.find(:xpath, './option[2]').value.should match Regexp.new(url+'phone_number')

  selects.find(:xpath, './option[3]').value.should match Regexp.new(url+'user')
  
  selects.find(:xpath, './option[4]').value.should match Regexp.new(url+'website')
end
