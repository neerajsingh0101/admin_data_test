When /^I visit (.*) page$/ do |target_page|
  if target_page == 'admin_data'
    visit '/admin_data'
  elsif target_page == 'quick_search'
    visit '/admin_data/quick_search/user'
  elsif target_page == 'user show'
    visit "/admin_data/klass/user/#{User.last.id}"
  end
end
