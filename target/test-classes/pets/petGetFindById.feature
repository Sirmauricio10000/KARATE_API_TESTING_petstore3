Feature: Pet_Get_FindById

    Background:
        * url 'https://petstore3.swagger.io/api/v3/pet/'



    #May fail if pets 1 - 5 are removed
    Scenario Outline: find pet by ID with ID <ID>
        And path '<ID>'
        When method GET
        Then status <statusCode>
        And match response.id == <response>
        Examples: 
            | ID   | statusCode  | response |
            | 1    | 200         | 1        |
            | 2    | 200         | 2        |
            | 3    | 200         | 3        |
            | 4    | 200         | 4        |
            | 5    | 200         | 5        |
            | -1   | 404         | null     |
            | -24  | 404         | null     |

    Scenario: find pet by string ID
        And path 'string'
        When method GET
        Then status 400
        And match response.message contains 'error'

    Scenario: find pet by null ID
        And path null
        When method GET
        Then status 405
        And match response.message contains 'Not Allowed'

    #
    Scenario: find pet by inexisting ID
        And path 5555555
        When method GET
        Then status 404
        And match response == 'Pet not found'

    Scenario: find pet by long ID
        And path 123412312534463456745754896796707435635634
        When method GET
        Then status 404
        And match response == 'Pet not found'
        