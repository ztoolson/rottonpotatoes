Feature: Use can manually add a movie

  Scenario: Add a movie
    Given I am on the RottenPotatoes home page
    When I follow the "Add new movie"
    Then I should be on the Create New Movie page
    When I fill in "Title" with "Men In Black"
    And I select "PG-13" from "Rating"
    And I press "Save changes"
    Then I should be on the Men in Black movie page
    And I should see "Men In Black successfully created"
