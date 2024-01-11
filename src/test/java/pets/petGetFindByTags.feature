
Feature: Pet_Get_FindByTags

Background:
    * url 'https://petstore3.swagger.io/api/v3/pet/findByTags'


    #May fail if there's no tags with values listed below
    Scenario Outline: find pet by tags with param: <tags>
        And param tags = <tags>
        When method GET
        Then status 200

        Examples:
            | tags  |
            | 'tag1'|
            | 'tag2'|
            | 'tag3'|
            | 'jknwejfcei'|

    Scenario: find pet by tags with invalid tag
        And param tags = 'invalid tag 21r231r12rd2s  x21r2 42312749821712 random chars to be sure :)'
        When method GET
        Then status 200
        And match response == []

    Scenario: find pet by tags with NULL param
        And param tags = null
        When method GET
        Then status 400
        And match response == 'No tags provided. Try again?'

    Scenario: find pet by tags with no param status 
        When method GET
        Then status 400
        And match response == 'No tags provided. Try again?'


    Scenario: find pet by tags with long list of tags
        * def longListOfTags = karate.repeat(1000000, function() { return '<randomTagName>'; })
        And param tags = '#(longListOfTags)'
        When method GET
        Then status 200

    Scenario: find pet by tags with empty list 
        And param tags = []
        When method GET
        Then status 400
        And match response == 'No tags provided. Try again?'