Given /^the following articles exist:$/ do |table|
  puts "pre-existing articles count: ", Article.count
  Article.create!(table.hashes)
end

Given /^the following comments exist:$/ do |table|
  puts "pre-existing articles count: ", Comment.count
  puts Comment.count
  Comment.create!(table.hashes)
end


Then /^I should see a merge form with "(.*?)" field$/ do |label|
  page.should have_field(label)
end