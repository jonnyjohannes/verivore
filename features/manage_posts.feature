Feature: Manage Posts
  In order to make a blog
  As an admin author
  I want to create and manage posts
  
  Scenario: Blog Listings
    Given I have posts called Foo and Bar
    When I go to the list of posts
    Then I should see "Foo"
    And I should see "Bar"
  
  Scenario: View Posts as a guest
    Given I am not an admin
    When I go to the list of posts
    Then I should not see "New Post"
  
  Scenario: Create a Valid Post
    Given I have any number of posts
    And I am an admin
    And I am on the list of posts
    When I follow "New Post"
    And I fill in "Title" with "Foo"
    And I fill in "Body" with "The hills are alive with the sound of music"
    And I press "Create"
    Then I should see "New Post Published"
    And I should see "Foo"
    And I should see "The hills are alive with the sound of music"
    And I should have 1 more article 

@comment
  Scenario: Leave a Comment
    Given I have a post called "Shazam"
    And I am reading "Shazam"
    When I fill in "Name" with "Foo"
    And I fill in "Email" with "foo@bar.com"
    And I fill in "Comment" with "This is awesome"
    Then I should see "Comment posted, thanks for the feedback"
    And I should see "This is awesome"
    And I should see "Foo"
    And I should not see "foo@bar.com"
    
# Scenario: Create an invalid Post
#   Given I am an admin
#   When I follow "New Post"
#   And I fill in "Title" with "Foo"
#   And I press "Create"
#   Then I should not see "Foo"
#   And I should see
    
