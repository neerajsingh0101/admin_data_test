Then /^page should have text as current date for "(.*)"$/ do |css_selector|
  wait_until { page.evaluate_script("jQuery.active === 0") }

  page.find(css_selector).value.should == Time.now.strftime('%d-%B-%Y')
end
