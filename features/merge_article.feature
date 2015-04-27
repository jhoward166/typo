Feature: Merge Articles
    As a blog administrator
    In order to avoid multiple articles with similar content
    I want to be able to merge articles
Background:
    Given the blog is set up
    And the following articles exists
    | title   | body         |
    | Foobar  | Lorem Ipsum  |
    | Example | Text example |
Scenario: I should not see merge articles button as a normal user
    Given I am logged as a normal user
    And I am on the article page for "Foobar"
    And show me the page
    Then I should not see "Merge"
Scenario: I should see merge articles button if I am logged as an administrator
    Given I am logged into the admin panel
    And I am on the article page for "Foobar"
    And show me the page
    Then I should see "Merge"
Scenario: Successfully merge articles body
    Given I am logged into the admin panel
    And I am on the article page for "Foobar"
    And I select to merge with "Example"
    And I press "Merge"
    Then the article "Foobar" should have body "Lorem Ipsum Text example"
    And show me the page
