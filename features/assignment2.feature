Feature: Assignment 2: User can manually add movie

Scenario: 4.3 Redirect to the show action for the new movie after a successful create
  Given I am on the RottenPotatoes home page
  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "foobar movie"
  And I select "NC-17" from "Rating"
  And I press "Save Changes"
  Then I should not be on the Rotten Potatoes homepage
  And I should see "foobar movie"

Scenario: 4.5a User changes mind while creating a movie
  Given I am on the RottenPotatoes home page
  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "foobar movie"
  And I press "Cancel"
  Then I should be on the homepage


Scenario: 4.5b User changes mind while updating a movie
  Given I am on the RottenPotatoes home page
  When I look in row 1, of the table and follow "Edit"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "foobar movie"
  And I press "Cancel"
  Then I should be on the homepage
