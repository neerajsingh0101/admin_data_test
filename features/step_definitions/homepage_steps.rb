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

#TODO try to convert it into a utility so that name and url could be passed in the feature
Then /^I should see page with proper dropdown values$/ do
  css_selector = 'drop_down_value_klass'
  url = '/admin_data/quick_search/'

  select_options = []
  select_options << {:position => 2, :text => 'phone_number', :value => "#{url}phone_number"}
  select_options << {:position => 3, :text => 'user', :value => "#{url}user"}
  select_options << {:position => 4, :text => 'website', :value => "#{url}website"}

  handy_select(css_selector, select_options)
end



=begin

# css_selector  only class names and ids are currently suppported.
# Usage:
#
# page.handy_has_select?('.active_users', [[{:text => 'India', :value => 'IN'}], [{:text => 'America', :value => 'USA']])
def handy_has_select?(css_selector, array)
end
     
=end
