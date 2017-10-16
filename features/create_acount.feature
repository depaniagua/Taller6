Feature: Create acount into los Estudiantes
    as a user I want to be able to create mi user acount in order to rate teachers

Scenario Outline: Create Acount with wrong information

  Given I go to losestudiantes home screen
    When I open the login screen
    And I fill register with <name> and <familyName> and <email> and <universidad> and <department> and <password> and <terms>
    And I try to register
    Then I be able to see validation message

    Examples:
      | name          | familyName    | email                       | universidad       | department    | password      | terms   |                       |
      | David         | Paniagua      | de.paniagua@uniandes.edu.co |                   |               |               | true    |                                 |
      