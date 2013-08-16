Given(/^I (?:am on|go to) (?:the|my) (.*?)$/) do |page_name|
  visit path_to(page_name)
end
