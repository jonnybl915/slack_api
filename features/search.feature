Feature: search

  Background:
    Given I'm on the home page

  Scenario: keyword search
    When I search for "King Street"
    Then "King Street" appears in the filter list
    And There are at least 10 results
    And each result mentions king

  Scenario: new user saves a search
    When I search for "Charleston"
    And I click "Save Search"
    And I complete registration
    And I click "Save Search"
    And I save the search as "CHS"
    Then I see "CHS" in my saved searches
    And I have a user account
    And my agent is located in Charleston

    Scenario: searching user gets squeezed
      When I search for "Charleston"
      And I click on the 1st property
      And I go back
      And I click on the 2nd property
      Then I see a registration form







