Feature: Manage Categories
  As a blog administrator
  In order to categorize articles in my blog
  I want to be able to manage categories of articles

  Scenario: Admin can manage categories
    Given the blog is set up for user "user1" with password "user1" and profile id "1"
    And I am logged in as user "user1" with password "user1"
    And I have admin rights
    When I am on the new category page
    And I should see "Categories"
    And I should see "Name"
    And I should see "Keywords"
    And I should see "Permalink"
    And I should see "Description"

  Scenario: Admin can add categories
    Given the blog is set up for user "user1" with password "user1" and profile id "1"
    And I am logged in as user "user1" with password "user1"
    And I have admin rights
    When I am on the new category page
    And I fill in "category_name" with "Category 1"
    And I fill in "category_description" with "Description 1"
    And I press "Save"
    Then I should be on the new category page
    And I should see "Category 1"
    And I should see "Description 1"

  Scenario: Admin can edit categories
    Given the blog is set up for user "user1" with password "user1" and profile id "1"
    And I am logged in as user "user1" with password "user1"
    And I have admin rights
    When I am on the new category page
    And I fill in "category_name" with "Category 1"
    And I fill in "category_description" with "Description 1"
    And I press "Save"
    Then I should be on the new category page
    And I should see "Category 1"
    And I should see "Description 1"
    When I fill in "category_name" with "Category 1 (edited)"
    And I press "Save"
    Then I should be on the new category page
    And I should see "Category 1 (edited)"



