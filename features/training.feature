Feature: API testing
  # listado de Mascotas
 Scenario:  GET PETS
   Given When I make a get in "/findByStatus?status=available"
   When it should return a response with a 200 response code
   Then it's body must contain the value "id" with "6544945"

 # creacion de 1 Mascota
  Scenario:  POTS PETS
   Given When I make a Post to Pets with name "bobyboxer1" and status "available" with id "180"
   When Post create Pets it should return a response with a 200 response code

 #Modificacion del nombre de la mascota
  Scenario: PUT data to pets to id
    Given  puts to change name "firulais" with id "180"
    When Change name Pets it should return response 200

  #Eliminacion de la mascota creada
  Scenario: DELETE PETS
   Given delete pets with id "180"
   When delete it should return a response with a 200

  #verificaion q la mascota fue eliminada correctamente
  Scenario:  GET PETS not found pets to id
    Given No found pets to id "180"
    When get pets for id response with a 404








