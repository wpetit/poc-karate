@user-management
Feature: User management testing

  Background:
    * url 'https://jsonplaceholder.typicode.com'
    * configure ssl = true

  @admin-role
  Scenario: get all users and then get the first user by id
    Given path 'users'
    When method get
    Then status 200

    * def first = response[0]

    Given path 'users', first.id
    When method get
    Then status 200

  @admin-role
  Scenario: create a user
    * def user =
      """
      {
        "name": "Test User",
        "username": "testuser",
        "email": "test@user.com",
        "address": {
          "street": "Has No Name",
          "suite": "Apt. 123",
          "city": "Electri",
          "zipcode": "54321-6789"
        }
      }
      """

    Given url 'https://jsonplaceholder.typicode.com'
    And path 'users'
    And request user
    When method post
    Then status 201

    * def id = response.id
    * print 'created id is: ', id
#
#  @admin-role
#  Scenario: get a unknown user
#    Given path 'users', '13'
#    When method get
#    Then status 200

