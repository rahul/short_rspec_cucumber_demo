# language: en

Feature: As a blogger, I should be able to create an account to help me keep track of my posts.
  I trust the website and users enough to not require a password to login for now.

  Background:
    Given my name is "Example User"
    And my email is "user@example.com"
    And my blog is "Example Blog"
    And There are 2 tables
      | table1 |
      | b|
      | c|

      | table2|
      |d|
      |e|

  Scenario: User visits the account creation page
    Given I am on the new user page
    When I fill my name in "Name"
    And I fill my email in "Email"
    And I fill "Example Blog" in "Blog"
    And I press "Submit"
    Then I should be on my blog page
    And I should see "This is Example User's blog Example Blog" as the title
    And I should see "Welcome. You can now start blogging away!" as the flash message

@wip
  Scenario: User creates a post
    Given I already have an account with blogger
    And I am on the login page
    When I fill my email in "Email"
    And I press "Login"
    Then I should be on my blog page
    When I click "New Post"
    Then I should be on the new post page
    When I fill "First Post" in "Title"
    And I fill "Hello World!" in "Post"
    And I press "Post!"
    Then I should be on my blog page
    And I should see 1 post titled "First Post"
