Given /^I have no questions$/ do
  Question.delete_all
end

Given /^I (only )?have questions titled "?([^\"]*)"?$/ do |only, titles|
  Question.delete_all if only
  titles.split(', ').each do |title|
    Question.create(:title => title)
  end
end

Then /^I should have ([0-9]+) questions?$/ do |count|
  Question.count.should == count.to_i
end
