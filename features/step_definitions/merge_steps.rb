Given /^the following articles exists$/ do |table|
    Article.create table.hashes
end
Then /^the article "(.*?)" should have body "(.*?)"$/ do |title, body|
    Article.find_by_title(title).body.should eq body
    end
Given /^I select to merge with "(.*?)"$/ do |title|
    fill_in('merge_with', :with => Article.find_by_title(title).id)
end
