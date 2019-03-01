Feature: Register into losestudiantes
    As an user I want to register myself within losestudiantes website in order to rate teachers

    Scenario Outline: Necessary for others test to pass

    	Given I go to losestudiantes home screen

	Examples:
  	|name|lastname|email|password|
  	|||||

    Scenario Outline: Register fails due to empty fields

	    Given I go to losestudiantes home screen
	    When I open the login screen
	    And I give my <name> and <lastname>
	    And I fill with <email> and <password>
	    And I select a bachelors program
	    And I try to register
	    Then I expect to observe an x icon

    Examples:
  	|name|lastname|email|password|
  	||a|a@a.com|123456789|
  	|name||a@a.com|123456789|
  	|name|a||123456789|
  	|name|a|a@a.com||

    Scenario Outline: Register fails due to short password

    	Given I go to losestudiantes home screen
    	When I open the login screen
    	And I give my <name> and <lastname>
	    And I fill with <email> and <password>
	    And I select a bachelors program
	    And I try to register
	    Then I expect to observe an x icon

	Examples:
  	|name|lastname|email|password|
  	|name|lastname|a@a.com|1234567|

    Scenario Outline: Register fails due to invalid email

	    Given I go to losestudiantes home screen
	    When I open the login screen
	    And I give my <name> and <lastname>
	    And I fill with <email> and <password>
	    And I select a bachelors program
	    And I try to register
	    Then I expect to see <error>

	Examples:
  	|name|lastname|email|password|error|
  	|name|lastname|a@a|12345678|Ingresa un correo valido|
  	|name|lastname|a.com|12345678|Ingresa un correo valido|
  	|name|lastname|a@acom|12345678|Ingresa un correo valido|

    Scenario Outline: Register fails due to already taken email

    	Given I go to losestudiantes home screen
   	 	When I open the login screen
   	 	And I give my <name> and <lastname>
	    And I fill with <email> and <password>
	    And I select a bachelors program
	    And I accept the terms and conditions
	    And I try to register
	    Then I expect to see a popup with the text: <error>

	Examples:
	|name|lastname|email|password|error|
  	|name|lastname|pepitoperez123@prueba.com|12345678|Ocurrió un error activando tu cuenta|

  	Scenario Outline: Register fails due to not acepting terms and conditions

  		Given I go to losestudiantes home screen
   	 	When I open the login screen
   	 	And I give my <name> and <lastname>
	    And I fill with <email> and <password>
	    And I select a bachelors program
	    And I try to register
	    Then I expect to see <error>

	Examples:
  	|name|lastname|email|password|error|
  	||a|a@a.com|123456789|Debes aceptar los términos y condiciones|

    Scenario Outline: Register is succesful

    	Given I go to losestudiantes home screen
    	When I open the login screen
    	And I give my <name> and <lastname>
	    And I fill with <email> and <password>
	    And I select a bachelors program
	    And I accept the terms and conditions
	    And I try to register
	    Then I expect to see a popup with the text: <success>

    Examples:
      |name|lastname|email|password|success|
      |aaa|aaa|a@a.com|prueba123|Registro exitoso!|