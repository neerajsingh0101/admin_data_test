When /^I visit (.*) page$/ do |target_page|
  case target_page
  when 'admin_data'
    visit '/admin_data'
  when 'quick_search'
    visit '/admin_data/quick_search/user'
  when 'user show'
    visit "/admin_data/klass/user/#{User.last.id}"
  when 'user feed'
    visit "/admin_data/feed/user"
  end
end
