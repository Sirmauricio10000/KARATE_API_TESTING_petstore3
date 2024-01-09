Feature: Pet_Get_FindByStatus

    Background:
        * url 'https://petstore3.swagger.io/api/v3/pet/findByStatus'

    Scenario: with param: "avaiable"
        And param status = 'available'
        When method GET
        Then status 200
        And match each response[*] == { status: 'available', name: '#notnull', id: '#notnull', category: { id: '#notnull', name: '#notnull' }, photoUrls: '#notnull', tags: '#notnull' }

    Scenario: with param: "pending"
        And param status = 'pending'
        When method GET
        Then status 200
        And match each response[*] == { status: 'pending', name: '#notnull', id: '#notnull', category: { id: '#notnull', name: '#notnull' }, photoUrls: '#notnull', tags: '#notnull' }

    Scenario: with param: "sold"
        And param status = 'sold'
        When method GET
        Then status 200
        And match each response[*] == { status: 'sold', name: '#notnull', id: '#notnull', category: { id: '#notnull', name: '#notnull' }, photoUrls: '#notnull', tags: '#notnull' }

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