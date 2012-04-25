When /^I go to the home page$/ do
  visit '/'
end

Then /^the answer should be "([^"]*)"$/ do |arg1|
  page.find_by_id('answer').text.should == arg1
end

