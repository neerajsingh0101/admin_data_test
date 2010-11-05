#TODO try to use a table like utility
Then /^page should have link with text "(.*)" within "(.*)" and url "(.*)"$/ do |text, css_selector, url|
  id = css_selector[1..-1]
  page.should have_xpath( "//div[@id='#{id}']//a[@href='#{url}']", :text => text )
end


def foo(selects, index, text)
  selects.find(:xpath, "./option[#{index}]", :text => text)
end

def foo2(selects, index, text)
  selects.find(:xpath, "./option[#{index}]").value.should match Regexp.new(text)
end

#TODO try to convert it into a utility so that name and url could be passed in the feature
Then /^I should see page with proper dropdown values$/ do
  page.should have_xpath("//select[@class='drop_down_value_klass']")
  selects =  page.find(:xpath, "//select[@class='drop_down_value_klass']")

  foo(selects, 2, 'phone_number')
  foo(selects, 3, 'user')
  foo(selects, 4, 'website')

  url = '/admin_data/quick_search/'
  foo2(selects, 2, url+'phone_number')
  foo2(selects, 3, url+'user')
  foo2(selects, 4, url+'website')
end



=begin

a = []
a << Array.wrap({:text => 'phone_number', :value => "#{url}phone_number"})
a << Array.wrap({:text => 'user', :value => "#{url}user"})
a << Array.wrap({:text => 'website', :value => "#{url}website"})

page.handy_has_select?(css_selector, a)


# css_selector  only class names and ids are currently suppported.
# Usage:
#
# page.handy_has_select?('.active_users', [[{:text => 'India', :value => 'IN'}], [{:text => 'America', :value => 'USA']])
def handy_has_select?(css_selector, array)
end
     
=end
