Feature: Planear viaje

  Scenario: As a user I want to plan my route using the app
    Given I press "Planear viaje en Transmi o SITP"
    Then I touch the "Punto de destino" text
    And I touch the "Seleccionar sitio en el mapa" text
    And I wait for 1 seconds
    And I touch the "Seleccionar" text
    And I press view with id "floating_button"
    And I should see text containing "Tu ubicación"
    And I should see text containing "Punto de mapa seleccionado"
