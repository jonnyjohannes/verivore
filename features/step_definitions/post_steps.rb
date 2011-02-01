Given /^I have posts called (.+)$/ do |titles|
  titles.split(', ').each do |title|
    Post.create!(:title => title, :body => "askjfds")
  end
end

Given /^I have any number of posts$/ do
  Post.all
end

Then /^I should have (\d+) more article$/ do |count|
  Post.count.should == count.to_i
end

Given /^I am an admin$/ do
  visit admin_url
  fill_in "password", :with => "b00mp0w"
  click_button "Log in"
end

Given /^I am not an admin$/ do
  visit logout_url
end

Given /^I have a post called "([^"]*)"$/ do |title|
  Post.create!(:title => title, :body => "Boom")
end

Given /^I am reading "([^"]*)"$/ do |title|
  visit posts_url(Post.find_by_title(title))
end