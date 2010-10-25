Then /^page should have text as current date for "(.*)"$/ do |css_selector|
  page.find(css_selector).text.should == 'today'
end
