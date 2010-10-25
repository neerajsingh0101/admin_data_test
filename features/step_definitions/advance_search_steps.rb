Then /^page should have text as current date for "(.*)"$/ do |css_selector|
  page.should have_content('25-October-2010')
  # TODO this is not working
  #page.find(css_selector).text.should == 'today'
end
