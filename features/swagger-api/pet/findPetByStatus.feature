# encoding: UTF-8
# language: ru

@all @findPetByStatus
Функционал: Поиск животных по статусу. https://petstore.swagger.io/#/pet/findPetsByStatus


  Структура сценария: Запрос на поиск животных по статусу возвращет список животных с указанным статусом
    * Отправил GET запрос на URL `https://petstore.swagger.io/v2/pet/findByStatus` c query параметрами:
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


#    создать животное и проверить что оно попало в список по статусу, id рандомный
@a
  Структура сценария: Запрос на поиск животных по статусу возвращет список животных включая только что созданное
    * Отправил POST запрос для создания животного на URL `https://petstore.swagger.io/v2/pet` c параметрами:
      | key           | value    |
      | id            |          |
      | category id   |          |
      | category name |          |
      | name          | ipr name |
      | photoUrls     | ipr url  |
      | tags id       |          |
      | tags name     |          |
      | status        | <status> |
    * Убедился, что код REST ответа = `200`
    * Распарсил JSON ответ
    * Запомнил id созданного или измененного животного
    * Убедился, что животное в ответе соответствует запросу по сохраненному id
    * Отправил GET запрос на URL `https://petstore.swagger.io/v2/pet/findByStatus` c query параметрами:
      | key    | value    |
      | status | <status> |
    * Убедился, что код REST ответа = `200`
    * Распарсил JSON ответ
    * Убедился, что в ответе для всех животных параметр `status` равен `<status>`
    * Убедился, что в ответе есть животное с сохраненным id
    * Удалил животное по сохраненному id
    * Убедился, что нет животного с сохраненным id

    Примеры:
      | status    |
      | available |
      | pending   |
      | sold      |


  Структура сценария: Запрос на поиск животных по невалидному статусу возвращет код ответа 400
    * Отправил GET запрос на URL `https://petstore.swagger.io/v2/pet/findByStatus` c query параметрами:
      | key    | value    |
      | status | <status> |
    * Убедился, что код REST ответа = `400`
    * Убедился, что в REST ответе поле `message` равно `Invalid status value`

    Примеры:
      | status         |
      | invalid status |
      | 1              |
      | ?              |