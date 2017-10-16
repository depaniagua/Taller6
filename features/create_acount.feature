Feature: Create acount into los Estudiantes
    as a user I want to be able to create mi user acount in order to rate teachers

Scenario Outline: Create Acount with wrong information

  Given I go to losestudiantes home screen
    When I open the login screen
    And I fill register with <name> and <familyName> and <email> and <password> and <terms>
    And I try to register
    Then I expect to see <validationMessage>

    Examples:
      | name     | familyName | email                       | password      | terms   | validationMessage                               |
      |          |            |                             |               | false   | Ingresa tu nombre                               |
      |          |            |                             |               | false   | Ingresa tu apellido                             |
      |          |            |                             |               | false   | Ingresa tu correo                               |
      | David    | Paniagua   | de.paniagua@uniandes.edu.co |               | false   | Ingresa una contraseña                          |
      | David    | Paniagua   |                             | 123           | false   | Ingresa tu correo                               |
      | David    | Paniagua   | de.paniagua@uniandes.edu.co | 123           | false   | La contraseña debe ser al menos de 8 caracteres |
      | David    | Paniagua   | de.paniagua@uniandes.edu.co | 12345678      | false   | Debes aceptar los términos y condiciones        |
      | David    | Paniagua   |                             | 12345678      | false   | Ingresa tu correo                               |  
      | David    | Paniagua   |                             | 123           | true    | Ingresa tu correo                               |
      | David    | Paniagua   | de.paniagua@uniandes.edu.co | 123           | true    | La contraseña debe ser al menos de 8 caracteres |
      | David    | Paniagua   |                             | 12345678      | true    | Ingresa tu correo                               |


Scenario Outline: Create Acount with correct information
  Given I go to losestudiantes home screen
    When I open the login screen
    And I fill register with <name> and <familyName> and <email>  and <password> and <terms>
    And I try to register
    Then I expect to display <popupMessage>

    Examples:
      | name     | familyName | email                        | password      | terms   | popupMessage                         |
      | David    | Paniagua   | de.paniagua@uniandes.edu.co  | miso2017      | true    | Ocurrió un error activando tu cuenta |
      | David    | Paniagua   | de.paniagua4@uniandes.edu.co | 12345678      | true    | Registro exitoso                     |

            