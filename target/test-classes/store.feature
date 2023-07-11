Feature: PetStore
  Background: Cabecera
    #Definimos url base
    Given url 'https://petstore.swagger.io/v2'


    #Siguiendo la pagina del "https://petstore.swagger.io/v2" identificamos el request
    #analizamos el request, que parametros definir y agregar para añadir una mascota a la tienda
    #una vez definida y replicada en la pagina consumimos el metodo (post) con status 200.
  @test
  Scenario: Añadir una mascota a la tienda.
    #Identificamos el path
    Given path '/pet'
    And request
    """
    {
      "id": '500',
      "category": {
        "id": 2,
        "name": "Animal"
      },
      "name": "Drako",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 10,
          "name": "Canino"
        }
      ],
      "status": "available"
    }
    """
    When method post
    Then status 200


    #Siguiendo la pagina del "https://petstore.swagger.io/v2" identificamos metodo a consumir
    #(GET) para la busqueda de la mascota con ID, referimos el Id del metodo anterior para
    # realizar la consulta correspondiente y visualizar que la mascota fue agrega correctamente.
  @test
  Scenario: Consultar la mascota ingresada previamente Búsqueda por ID.
    Given path '/pet/500'
    When method get
    Then status 200


    #Siguiendo la pagina del "https://petstore.swagger.io/v2" identificamos metodo a consumir
    #(PUT) status 200 la cual nos sirve para actulizar data.
    #En este caso nos pide actualizar el name y status de la mascota.
  @test
  Scenario: Actualizar el nombre de la mascota y el estatus de la mascota a sold.
    #Identificamos el path
    Given path '/pet'
    And request
    """
    {
      "id": 500,
      "category": {
        "id": 2,
        "name": "Animal"
      },
      "name": "Lalo",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 10,
          "name": "Canino"
        }
      ],
      "status": "sold"
    }
    """
    When method put
    Then status 200

    #Siguiendo la pagina del "https://petstore.swagger.io/v2" identificamos metodo a consumir
    #(GET) para la busqueda de la mascota por status=sold.
    # realizar la consulta correspondiente y visualizar que la mascota fue actualizada correctamente.
  @test
  Scenario: Consultar la mascota modificada por estatus Búsqueda por estatus.
    #Url completa por caracter especial "?"
    Given url 'https://petstore.swagger.io/v2/pet/findByStatus?status=sold'
    When method get
    Then status 200

