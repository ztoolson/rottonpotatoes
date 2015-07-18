Feature: display list of movies filtered by MPAA rating

  As a concerned parent
  So that I can quickly browse movies appropriate for my family
  I want to see movies matching only certain MPAA ratings

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
    
    And I am on the Rotton Potatoes homepage

  Scenario: restrict movies with 'PG' or 'R' ratings
    # enter step(s) to check the 'PG' and 'R' checkboxes
    # enter step(s) to uncheck all other checkboxes
    # enter step to "submit" the search form on the homepage
    # enter steps(s) to ensure that PG and R movies are visible
    # enter steps(s) to ensure all other movies are not visible

  Scenario: all ratings selected
    # your steps here
