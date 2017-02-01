Feature: search

  Scenario: search for Sullivan's
    Given I'm on the home page
    When I search for "King Street"
    Then "King Street" appears in the filter list
    And There are at least 10 results
    And Each result is on King Street


  Scenario: new user save search
    Given I'm on the home screen
