Feature: display list of movies sorted by different criteria

  As an avid moviegoer
  So that I can quickly browse movies based on my preferences
  I want to see movies sorted by title, rating, or release date

  Background: movies have been added to the database

    Given the following movies exist:
    | title                   | rating | release_date |
    | Aladdin                 | G      | 25-Nov-1992  |
    | The Terminator          | R      | 26-Oct-1984  |
    | When Harry Met Sally    | R      | 21-Jul-1989  |
    | The Help                | PG-13  | 10-Aug-2011  |
    | Chocolat                | PG-13  | 5-Jan-2001   |
    | Amelie                  | R      | 25-Apr-2001  |
    | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
    | The Incredibles         | PG     | 5-Nov-2004   |
    | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
    | Chicken Run             | G      | 21-Jun-2000  |
    
    And I am on the RottenPotatoes home page

  Scenario: sort movies alphabetically
    # Default sorted by title
    Then "Aladdin" should come before "Chocolat"
    When I follow "Title" again
    Then "The Incredibles" should come before "Raiders of the Lost Ark"
    
  Scenario: sort movies in order of release date
    When I follow "Release Date"
    Then "The Terminator" should come before "When Harry Met Sally"
    When I follow "Release Date" again
    Then "When Harry Met Sally" should come before "The Terminator"

  Scenario: sort movies by rating
    When I follow "Rating"
    Then "Chicken Run" should come before "Amelie"
    When I follow "Rating" again
    Then "Amelie" should come before "Chicken Run"
