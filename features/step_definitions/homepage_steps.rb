#TODO try to use a table like utility
Then /^page should have link with text "(.*)" within "(.*)" and url "(.*)"$/ do |text, css_selector, url|
  id = css_selector[1..-1]
  page.should have_xpath( "//div[@id='#{id}']//a[@href='#{url}']", :text => text )
end

def handy_has_select?(css_selector, select_options)
  selector = css_selector[1..-1]
  case css_selector[0,1]
  when '.'
    attribute = "@class='#{selector}'"
  when '#'
    attribute = "@id='#{selector}'"
  else
    raise 'only css_selector class or id is currently supported'
  end

  page.should have_xpath("//select[#{attribute}]")
  selects = page.find(:xpath, "//select[#{attribute}]")

  select_options.each do |h|
    selects.find(:xpath, "./option[#{h[:position]}]", :text => h[:text])
    if h[:value_match_type] == 'regex'
      selects.find(:xpath, "./option[#{h[:position]}]").value.should match Regexp.new(h[:value])
    else
      selects.find(:xpath, "./option[#{h[:position]}]", :text => h[:value])
    end
  end
end

Then /^I should see dropdown with css_selector "(.*)" with following options:$/ do |css_selector, table|
  handy_has_select?(css_selector, table.hashes)
end
