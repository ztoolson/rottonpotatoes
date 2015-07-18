Feature: Use can manually add a movie

  Scenario: Add a movie
    Given I am on the Rotton Potatoes home page
    When I follow the "Add new movie"
    Then I should be on the Creare New Movie page
    When I fill in "Title" with "Men In Black"
    And I select "PG-13" from "Rating"
    And I press "Save Changes"
    Then I should be on the Rotton Potatoes home page
    And I should see "Men In Black"
