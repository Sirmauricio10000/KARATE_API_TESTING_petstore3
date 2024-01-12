Feature: Pet_Post

Background:
  * url 'https://petstore3.swagger.io/api/v3/pet/'

    Scenario Outline: Creating new element PET with id <ID>
        * def id = <ID>
        * def body = 
        """
        {
            "id": "#(id)",
            "category": {
            "id": 2,
            "name": "Chaucito"
            },
            "name": "Gatitotototo",
            "photoUrls": [],
            "tags": [
            {
                "id": 1,
                "name": "Bizcocho"
            }
            ],
            "status": "sold"
        }
        """

        #creating
        Given request body 
        When method post 
        And match response == body 

        #cleaning
        Given path id
        When method delete
        Then status 200

        Examples:
        | ID  |
        | 775588991|
        | 669988038|
        | 342428573|
        | 532452446|


    Scenario: Creating multiple pets with same ID
        * def id = 93181424
        * def body = 
        """
        {
            "id": "#(id)",
            "category": {
            "id": 2,
            "name": "Chaucito"
            },
            "name": "Gatitotototo",
            "photoUrls": [],
            "tags": [
            {
                "id": 1,
                "name": "Bizcocho"
            }
            ],
            "status": "sold"
        }
        """

        #cleaning before if exist
        Given path id
        When method delete

        #creating
        Given request body 
        When method post 
        Then status 200

        Given request body 
        When method post 
        Then status 409

        #cleaning after
        Given path id
        When method delete
        Then status 200