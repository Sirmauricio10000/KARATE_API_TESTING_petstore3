Feature: plan de pruebas

    Scenario: Caso de pruebas
    Given url 'https://petstore3.swagger.io/api/v3/pet/findByStatus'
    And param status = 'available'
    When method GET
    Then status 200