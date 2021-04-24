# encoding: UTF-8
# language: ru


Функционал: Добавление нового животного. https://petstore.swagger.io/#/pet/addPet


  Сценарий: Запрос на добавление нового животного только с обязательными параметрами создает животное
    * Отправил POST запрос на URL `https://petstore.swagger.io/v2/pet` c параметрами:
      | key           | value    |
      | id            |          |
      | category id   |          |
      | category name |          |
      | name          | ipr name |
      | photoUrls     | ipr url  |
      | tags id       |          |
      | tags name     |          |
      | status        |          |
    * Убедился, что код REST ответа = `200`


  Структура сценария: Запрос на добавление нового животного со всеми параметрами создает животное
    * Отправил POST запрос на URL `https://petstore.swagger.io/v2/pet` c параметрами:
      | key           | value             |
      | id            | 45756744          |
      | category id   | 1                 |
      | category name | ipr category name |
      | name          | ipr name          |
      | photoUrls     | ipr url           |
      | tags id       | 1                 |
      | tags name     | ipr tags name     |
      | status        | <status>          |
    * Убедился, что код REST ответа = `200`

    Примеры:
      | status    |
      | available |
      | pending   |
      | sold      |


  Сценарий: Запрос на добавление нового животного без обязательного параметра name возвращает код ответа 405
    * Отправил POST запрос на URL `https://petstore.swagger.io/v2/pet` c параметрами:
      | key           | value   |
      | id            |         |
      | category id   |         |
      | category name |         |
      | name          |         |
      | photoUrls     | ipr url |
      | tags id       |         |
      | tags name     |         |
      | status        |         |
    * Убедился, что код REST ответа = `405`


  Сценарий: Запрос на добавление нового животного без обязательного параметра photoUrls возвращает код ответа 405
    * Отправил POST запрос на URL `https://petstore.swagger.io/v2/pet` c параметрами:
      | key           | value    |
      | id            |          |
      | category id   |          |
      | category name |          |
      | name          | ipr name |
      | photoUrls     |          |
      | tags id       |          |
      | tags name     |          |
      | status        |          |
    * Убедился, что код REST ответа = `405`


  Сценарий: Запрос на добавление нового животного с невалидным параметром id возвращает код ответа 405
    * Отправил POST запрос на URL `https://petstore.swagger.io/v2/pet` c параметрами:
      | key           | value      |
      | id            | invalid id |
      | category id   |            |
      | category name |            |
      | name          | ipr name   |
      | photoUrls     | ipr url    |
      | tags id       |            |
      | tags name     |            |
      | status        |            |
    * Убедился, что код REST ответа = `405`


  Сценарий: Запрос на добавление нового животного с невалидным параметром category id возвращает код ответа 405
    * Отправил POST запрос на URL `https://petstore.swagger.io/v2/pet` c параметрами:
      | key           | value               |
      | id            |                     |
      | category id   | invalid category id |
      | category name |                     |
      | name          | ipr name            |
      | photoUrls     | ipr url             |
      | tags id       |                     |
      | tags name     |                     |
      | status        |                     |
    * Убедился, что код REST ответа = `405`


  Сценарий: Запрос на добавление нового животного с невалидным параметром tags id возвращает код ответа 405
    * Отправил POST запрос на URL `https://petstore.swagger.io/v2/pet` c параметрами:
      | key           | value           |
      | id            |                 |
      | category id   |                 |
      | category name |                 |
      | name          | ipr name        |
      | photoUrls     | ipr url         |
      | tags id       | invalid tags id |
      | tags name     |                 |
      | status        |                 |
    * Убедился, что код REST ответа = `405`


  Сценарий: Запрос на добавление нового животного с невалидным параметром status возвращает код ответа 405
    * Отправил POST запрос на URL `https://petstore.swagger.io/v2/pet` c параметрами:
      | key           | value          |
      | id            |                |
      | category id   |                |
      | category name |                |
      | name          | ipr name       |
      | photoUrls     | ipr url        |
      | tags id       |                |
      | tags name     |                |
      | status        | invalid status |
    * Убедился, что код REST ответа = `405`