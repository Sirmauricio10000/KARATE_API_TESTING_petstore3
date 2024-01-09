Feature: Pet_Get_FindByStatus

    Background:
        * url 'https://petstore3.swagger.io/api/v3/pet/findByStatus'

    
    #May fail if there's no registered pets with some of the status below
    Scenario Outline: find pet by status with param: <status>   
        And param status = <status>
        When method GET
        Then status 200
        And match each response[*] == { status: <status>, name: '#notnull', id: '#notnull', category: { id: '#notnull', name: '#notnull' }, photoUrls: '#notnull', tags: '#notnull' }
        Examples:
            | status           |
            | 'available'      |
            | 'pending'        |
            | 'sold'           |

    Scenario: find pet by status with param: "nonValidEntry"
        And param status = 'nonValidEntry'
        When method GET
        Then status 400
        And match response.message contains 'error'

    Scenario: find pet by status with NULL status
        And param status = null
        When method GET
        Then status 400
        And match response == 'No status provided. Try again?'

    Scenario: find pet by status with no param status 
        When method GET
        Then status 400
        And match response == 'No status provided. Try again?'
