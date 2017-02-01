Feature: search

  Background:
    Given I'm on the home page

  Scenario: keyword search
    When I search for "King Street"
    Then "King Street" appears in the filter list
    And There are at least 10 results
    And each result mentions king

  Scenario: new user saves asearch
    When I search for "Charleston"
    And I click "Save This Search"
    And I complete registration
    And I click "Save This Search"
    And I name the search "CHS"
    Then I see "CHS" in my saved search
    And I have a user account




