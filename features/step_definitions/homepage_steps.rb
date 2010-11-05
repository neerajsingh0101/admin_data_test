#TODO try to use a table like utility
Then /^page should have link with text "(.*)" within "(.*)" and url "(.*)"$/ do |text, css_selector, url|
  id = css_selector[1..-1]
  page.should have_xpath( "//div[@id='#{id}']//a[@href='#{url}']", :text => text )
end

def handy_select(css_selector, select_options)
  page.should have_xpath("//select[@class='#{css_selector}']")
  selects = page.find(:xpath, "//select[@class='#{css_selector}']")

  select_options.each do |h|
    selects.find(:xpath, "./option[#{h[:position]}]", :text => h[:text])
    selects.find(:xpath, "./option[#{h[:position]}]").value.should match Regexp.new(h[:value])
  end
end

Then /^I should see dropdown with css_selector ".(.*)" with following options:$/ do |css_selector, table|
  handy_select(css_selector, table.hashes)
end



=begin

# css_selector  only class names and ids are currently suppported.
# Usage:
#
# page.handy_has_select?('.active_users', [[{:text => 'India', :value => 'IN'}], [{:text => 'America', :value => 'USA']])
def handy_has_select?(css_selector, array)
end
     
=end
