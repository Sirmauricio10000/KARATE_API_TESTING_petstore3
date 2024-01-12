Feature: Pet_Update

Background:
    * url 'https://petstore3.swagger.io/api/v3/pet/'

Scenario Outline: Creating and Updating PET with id <ID>
    * def id = <ID>
    * def bodyCreate = 
    """
    {
        "id": "#(id)",
        "category": {
        "id": 2,
        "name": "Chaucito"
        },
        "name": "testCreated",
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

    * def bodyUpdate = 
    """
    {
        "id": "#(id)",
        "category": {
        "id": 2,
        "name": "Chaucito"
        },
        "name": "testUpdated",
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
    Given request bodyCreate 
    When method post 

    #Updating
    Given request bodyUpdate 
    When method put 
    And match response == bodyUpdate 
    Then status 200

    #cleaning
    Given path id
    When method delete

    Examples:
    | ID  |
    | 775588991|
    | 669988038|
    | 342428573|
    | 532452446|
