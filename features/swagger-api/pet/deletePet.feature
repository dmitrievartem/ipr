# encoding: UTF-8
# language: ru

@all @deletePet
Функционал: Удаление животного по id. https://petstore.swagger.io/#/pet/deletePet


  Сценарий: Удаление созданного животного по id
    * Отправил POST запрос для создания животного на URL `https://petstore.swagger.io/v2/pet` c параметрами:
      | key           | value    |
      | id            | 45479754 |
      | category id   |          |
      | category name |          |
      | name          | ipr name |
      | photoUrls     | ipr url  |
      | tags id       |          |
      | tags name     |          |
      | status        |          |
    * Отправил DELETE запрос на URL `https://petstore.swagger.io/v2/pet` c path параметром `45479754`
    * Убедился, что код REST ответа = `200`


  Сценарий: Запрос на удаление животного по несуществующему id возвращает код ответа 404
    * Отправил DELETE запрос на URL `https://petstore.swagger.io/v2/pet` c path параметром `45479754`
    * Убедился, что код REST ответа = `404`
    * Распарсил JSON ответ


  Сценарий: Запрос на удаление животного по невалидному id возвращает код ответа 404
    * Отправил DELETE запрос на URL `https://petstore.swagger.io/v2/pet` c path параметром `invalid_id`
    * Убедился, что код REST ответа = `400`