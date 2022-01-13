@post-management
Feature: Post management testing

  Background:
    * url 'https://jsonplaceholder.typicode.com'
    * configure ssl = true

  @user-role
  Scenario: get all posts and then get the first post by id
    Given path 'posts'
    When method get
    Then status 200

    * def first = response[0]

    Given path 'posts', first.id
    When method get
    Then status 200

  @user-role
  Scenario: create a post and then get it by id
    * def post =
      """
      {
        userId: 1,
        title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        body: "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto"
      }
      """

    Given path 'posts'
    And request post
    When method post
    Then status 201

    * def id = response.id
    * print 'created id is: ', id
  