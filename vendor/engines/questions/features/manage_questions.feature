@questions
Feature: Questions
  In order to have questions on my website
  As an administrator
  I want to manage questions

  Background:
    Given I am a logged in refinery user
    And I have no questions

  @questions-list @list
  Scenario: Questions List
   Given I have questions titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of questions
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @questions-valid @valid
  Scenario: Create Valid Question
    When I go to the list of questions
    And I follow "Add New Question"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 question

  @questions-invalid @invalid
  Scenario: Create Invalid Question (without title)
    When I go to the list of questions
    And I follow "Add New Question"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 questions

  @questions-edit @edit
  Scenario: Edit Existing Question
    Given I have questions titled "A title"
    When I go to the list of questions
    And I follow "Edit this question" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of questions
    And I should not see "A title"

  @questions-duplicate @duplicate
  Scenario: Create Duplicate Question
    Given I only have questions titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of questions
    And I follow "Add New Question"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 questions

  @questions-delete @delete
  Scenario: Delete Question
    Given I only have questions titled UniqueTitleOne
    When I go to the list of questions
    And I follow "Remove this question forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 questions
 