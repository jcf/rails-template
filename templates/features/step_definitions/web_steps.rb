Given /^I am on (?:the|my) (.*?)$/ do |page_name|
  visit path_to(page_name)
end
