Feature: King
  As a client
  I should be able to plan out my project
  In order to tell the storytellers what I want

  Scenario: Creating a project
    Given I have a details ready
    When I sign up for Bard
    And I create a Quest
    And I create and assign some Epics to the Quest
    Then I should be see pricing for my Quest
    And I should see available Guilds for hire
