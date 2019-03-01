Feature: Planear viaje a turismo

  Scenario: As a user I want to see the route of a bus
    Given I press "Turismo"
    Then I touch the "Bibliotecas" text
    Then I touch the "PLANEAR VIAJE" text
    And I should see text containing "Tu ubicación"
    And I should see text containing "Biblioteca Bosa"
