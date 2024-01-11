Feature: Pet_Get_FindByStatus

    Background:
        * url 'https://petstore3.swagger.io/api/v3/pet/findByStatus'

    
    Scenario Outline: find pet by status with param: <status>   
        And param status = <status>
        When method GET
        Then assert responseStatus == 200
        * eval
        """
            if (response.length > 0 && response[0].status !== <status>) {
              karate.fail("The param status it's not the same")
            }
        """

        Examples:
        | status           |
        | 'available'      |
        | 'pending'        |
        | 'sold'           |

    Scenario: find pet by status with param: "nonValidEntry"
        And param responseStatus = 'nonValidEntry'
        When method GET
        Then assert responseStatus == 400
        And match response contains 'No status provided'

    Scenario: find pet by status with NULL status
        And param responseStatus = null
        When method GET
        Then assert responseStatus == 400
        And match response contains 'No status provided'

    Scenario: find pet by status with no param status 
        When method GET
        Then assert responseStatus == 400
        And match response contains 'No status provided'
