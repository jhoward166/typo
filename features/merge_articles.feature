Feature: Merge Articles
  As a blog administrator
  In order to reduce amount of similar articles in my blog
  I want to be able to merge articles in my blog

  Scenario: A non-admin cannot merge two articles
    Given the blog is set up for user "user1" with password "user1" and profile id "2"
    And I am logged in as user "user1" with password "user1"
    And I have no admin rights
    When I am on the new article page
    And I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"
    Then I should be on the admin content page
    And I should see "Foobar"
    When I follow "Foobar"
    Then I should see "Lorem Ipsum"
    And I should not see "Merge Articles"

  Scenario: Admin can merge two articles
    Given the blog is set up for user "user1" with password "user1" and profile id "1"
    And I am logged in as user "user1" with password "user1"
    And I have admin rights
    When I am on the new article page
    And I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"
    Then I should be on the admin content page
    And I should see "Foobar"
    When I follow "Foobar"
    Then I should see "Lorem Ipsum"
    And I should see "Merge Articles"

