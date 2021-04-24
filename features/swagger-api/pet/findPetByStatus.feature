# encoding: UTF-8
# language: ru


Функционал: Поиск животных по статусу. https://petstore.swagger.io/#/pet/findPetsByStatus


  Структура сценария: Запрос на поиск животных по статусу возвращет список животных с указанным статусом
    * Делаю GET запрос на URL `https://petstore.swagger.io/v2/pet/findByStatus` c query параметрами:
      | key    | value    |
      | status | <status> |
    * Убедился, что код REST ответа = `200`
    * Распарсил JSON ответ
    * Убедился, что в ответе для всех животных параметр `status` равен `<status>`

    Примеры:
      | status    |
      | available |
      | pending   |
      | sold      |


  Структура сценария: Запрос на поиск животных по невалидному статусу возвращет код ответа 400
    * Делаю GET запрос на URL `https://petstore.swagger.io/v2/pet/findByStatus` c query параметрами:
      | key    | value    |
      | status | <status> |
    * Убедился, что код REST ответа = `400`
    * Распарсил JSON ответ
    * Убедился, что в ответе для всех животных параметр `status` равен `<status>`

    Примеры:
      | status         |
      | invalid status |
      | 1              |
      | ?              |