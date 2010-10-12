Then /^footer should have link "(.*)" linking to "(.*)"$/ do |text, url|
  assert_match text, page.find(:xpath, "//div[@id='footer']//a[@href='#{url}']").text
end

Then /^I should see page with proper dropdown values$/ do 
  selects =  page.find(:xpath, "//select[@class='drop_down_value_klass']")
  assert selects

  assert_equal 'phone_number', selects.find(:xpath, './option[2]').text
  assert_equal 'user', selects.find(:xpath, './option[3]').text
  assert_equal 'website', selects.find(:xpath, './option[4]').text

  url = 'http://localhost:9887/admin_data/quick_search/'
  assert_equal url+'phone_number', selects.find(:xpath, './option[2]').value
  assert_equal url+'user', selects.find(:xpath, './option[3]').value
  assert_equal url+'website', selects.find(:xpath, './option[4]').value
end
