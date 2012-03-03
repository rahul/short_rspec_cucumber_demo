Given /^my name is "([^"]*)"$/ do |arg1|
  @my_name = arg1
end

Given /^my email is "([^"]*)"$/ do |arg1|
  @my_email = arg1
end

Given /^my blog is "([^"]*)"$/ do |arg1|
  @my_blog = arg1
end

Given /^I am on the new user page$/ do
  visit '/users/new'
end

When /^I fill my name in "([^"]*)"$/ do |arg1|
  fill_in arg1, :with => @my_name
end

When /^I fill my email in "([^"]*)"$/ do |arg1|
  fill_in arg1, :with => @my_email
end

When /^I fill "([^"]*)" in "([^"]*)"$/ do |arg1, arg2|
  fill_in arg2, :with => arg1
end

When /^I press "([^"]*)"$/ do |arg1|
  click_button arg1
end

Then /^I should be on my blog page$/ do
  @my_id = User.find_by_email(@my_email).id
  uri = URI.parse(current_url)
  uri.path.should == user_posts_path(@my_id)
end

Then /^I should see "([^"]*)" as the title$/ do |arg1|
  page.should have_selector('#title', :content => arg1)
end

Then /^I should see "([^"]*)" as the flash message$/ do |arg1|
  page.should have_selector('#flash', :content => arg1)
end

Given /^I already have an account with blogger$/ do
  user = User.create!(:email => @my_email, :name => @my_name)
  user.create_blog(:title => @my_blog)
end

Given /^I am on the login page$/ do
  visit '/users'
end

When /^I click "([^"]*)"$/ do |arg1|
  click_link arg1
end

Then /^I should be on the new post page$/ do
  @my_id = User.find_by_email(@my_email).id
  uri = URI.parse(current_url)
  uri.path.should == new_user_post_path(@my_id)
end

Then /^I should see (\d+) post titled "([^"]*)"$/ do |arg1, arg2|
  page.should have_selector('td', :content => arg2)
end
