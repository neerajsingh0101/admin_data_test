Then /^footer should have link with text "(.*)" and url "(.*)"$/ do |text, url|
  page.find(:xpath, "//div[@id='footer']//a[@href='#{url}']").text.should == text
end

Then /^I should see page with proper dropdown values$/ do
  selects =  page.find(:xpath, "//select[@class='drop_down_value_klass']")
  assert selects

  selects.find(:xpath, './option[2]').text.should == 'phone_number'

  selects.find(:xpath, './option[3]').text.should == 'user'

  selects.find(:xpath, './option[4]').text.should == 'website'

  url = 'http://localhost:9887/admin_data/quick_search/'
  selects.find(:xpath, './option[2]').value.should == url+'phone_number'

  selects.find(:xpath, './option[3]').value.should == url+'user'
  
  selects.find(:xpath, './option[4]').value.should == url+'website' 
end
