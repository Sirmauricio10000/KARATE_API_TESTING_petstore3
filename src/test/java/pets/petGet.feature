Feature: Pet_Get_FindByStatus

    Background:
        * url 'https://petstore3.swagger.io/api/v3/pet/findByStatus'

    Scenario Outline: with param: <status>
        And param status = <status>
        When method GET
        Then status 200
        And match each response[*] == { <status>: 'available', name: '#notnull', id: '#notnull', category: { id: '#notnull', name: '#notnull' }, photoUrls: '#notnull', tags: '#notnull' }
        Examples:
        | status          |
        | 'avaiable'      |
        | 'pending'       |
        | 'sold'          |

    Scenario: with param: "nonValidEntry"
        And param status = 'nonValidEntry'
        When method GET
        Then status 400
        And match response.message == 'Input error: query parameter `status value `nonValidEntry` is not in the allowable values `[available, pending, sold]`'

    Scenario: with param: NULL
        And param status = null
        When method GET
        Then status 400
        And match response == 'No status provided. Try again?'

    Scenario: with no param status 
        When method GET
        Then status 400
        And match response == 'No status provided. Try again?'