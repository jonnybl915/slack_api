Feature: search

  Scenario: search for Sullivan's
    Given I'm on the home page
    When I search for "King Street"
    Then "King Street" appears in the filter list
    And There are at least 10 results
    And Each result is on King Street


  Scenario: new user save search
    Given I'm on the home page
    When I search for "..."
    And I click "Save Search"
    And I complete registration
    And I click "Save Search"
    And I name the search "My Search"
    Then I see my saved search
    And I have a user account

