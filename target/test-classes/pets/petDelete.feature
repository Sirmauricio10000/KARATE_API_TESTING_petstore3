Feature:  Pet_Delete

Background:
  * url 'https://petstore3.swagger.io/api/v3/pet/'

    Scenario Outline: Creating and Deleting Pet <ID>
        * def id = <ID>
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

        #removing rss before execute test
        Given path id
        When method delete

        #creating
        Given request body 
        When method post 

        #Deleting
        Given path id
        When method delete
        Then status 200

        Examples:
        | ID  |
        | 775588991|
        | 669988038|
        | 342428573|
        | 532452446|


    Scenario: Deleting same pet 2 times
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

        #creating
        Given request body 
        When method post 

        #Deleting first time
        Given path id
        When method delete
        Then status 200

        #Deleting again
        Given path id
        When method delete
        Then status 404