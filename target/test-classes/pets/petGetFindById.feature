Feature: Pet_Get_FindById

    Background:
        * url 'https://petstore3.swagger.io/api/v3/pet/'



    Scenario Outline: find pet by ID with ID <ID>
        And path '<ID>'
        When method GET
        Then assert responseStatus == 200 || responseStatus == 404

        * eval 
        """
            if (responseStatus == 200 && response.id != <ID> || responseStatus == 404 && response != "Pet not found"){
                 karate.fail("The param response it's not was expected.")
            }
        """


        Examples: 
        | ID       |
        | 1        |
        | 2        |
        | 3        |
        | 4        |
        | 5        |
        | -1       |
        | -24      |

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
        And match response contains 'Pet not found'

    Scenario: find pet by long ID
        And path 123412312534463456745754896796707435635634
        When method GET
        Then status 404
        * match response contains 'Pet not found' || response contains 'too long entry'
        