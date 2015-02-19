Given /I have added "([^"]*?)" with rating "([^"]*?)"/ do |title, rating|
  steps %Q{
    Given I am on the Create New Movie page
    When I fill in "Title" with "#{title}"
    And I select "#{rating}" from "Rating"
    And I press "Save Changes"
  }
end

When /I look in row ([0-9]+?), of the table and follow "([^"]*?)"/ do |row, link|
  within all('table tr')[row.to_i - 1] do
    click_link link
  end
end
