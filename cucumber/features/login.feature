Feature: Login into losestudiantes
    As an user I want to authenticate myself within losestudiantes website in order to rate teachers

	Scenario Outline: Login failed with wrong inputs

	    Given I go to losestudiantes home screen
	    When I open the login screen
	    And I enter with <email> and <password>
	    And I try to login
	    Then I expect to see <error>

    Examples:
      | email            | password | error                    |
      |                  |          | Ingresa una contraseña   |
      | miso@gmail.com   |    1234  | Upss! El correo y        |

	Scenario Outline: Login success

	    Given I go to losestudiantes home screen
	    When I open the login screen
	    And I enter with <email> and <password>
	    And I try to login
	    Then I expect to see the user icon

    Examples:
      | email|password|success|
      | pepitoperez123@prueba.com|prueba123|Busca y califica profesores y clases anónimamente|

