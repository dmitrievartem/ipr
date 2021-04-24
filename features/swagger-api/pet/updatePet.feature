# encoding: UTF-8
# language: ru

@all @updatePet
Функционал: Обновление информации о животном. https://petstore.swagger.io/#/pet/updatePet


  Сценарий: Обновление информации о животном
    * Отправил POST запрос для создания животного на URL `https://petstore.swagger.io/v2/pet` c параметрами:
      | key           | value             |
      | id            |                   |
      | category id   | 1                 |
      | category name | ipr category name |
      | name          | ipr name          |
      | photoUrls     | ipr photoUrls     |
      | tags id       | 1                 |
      | tags name     | ipr tags          |
      | status        | available         |
    * Убедился, что код REST ответа = `200`
    * Распарсил JSON ответ
    * Запомнил id созданного или измененного животного
    * Отправил PUT запрос на URL `https://petstore.swagger.io/v2/pet` c сохраненным id и параметрами:
      | key           | value   |
      | id            |         |
      | category id   | 2       |
      | category name | updated |
      | name          | updated |
      | photoUrls     | updated |
      | tags id       | 2       |
      | tags name     | updated |
      | status        | sold    |
    * Убедился, что код REST ответа = `200`
    * Распарсил JSON ответ
    * Запомнил id созданного или измененного животного
    * Удалил животное по сохраненному id


  Сценарий: Обновление информации о животном с указанием невалидного параметра id возвращает код ответа 400
    * Создал животное
    * Убедился, что код REST ответа = `200`
    * Распарсил JSON ответ
    * Запомнил id созданного или измененного животного
    * Отправил PUT запрос на URL `https://petstore.swagger.io/v2/pet` и параметрами:
      | key           | value      |
      | id            | invalid id |
      | category id   | 2          |
      | category name | updated    |
      | name          | updated    |
      | photoUrls     | updated    |
      | tags id       | 2          |
      | tags name     | updated    |
      | status        | sold       |
    * Убедился, что код REST ответа = `400`
    * Удалил животное по сохраненному id


  Сценарий: Обновление информации о животном с указанием неcуществующего параметра id возвращает код ответа 404
    * Создал животное
    * Убедился, что код REST ответа = `200`
    * Распарсил JSON ответ
    * Запомнил id созданного или измененного животного
    * Отправил PUT запрос на URL `https://petstore.swagger.io/v2/pet` и параметрами:
      | key           | value     |
      | id            | 999947354 |
      | category id   | 2         |
      | category name | updated   |
      | name          | updated   |
      | photoUrls     | updated   |
      | tags id       | 2         |
      | tags name     | updated   |
      | status        | sold      |
    * Убедился, что код REST ответа = `404`
    * Удалил животное по сохраненному id


  Сценарий: Обновление информации о животном с указанием невалидного параметра category id возвращает код ответа 405
    * Создал животное
    * Убедился, что код REST ответа = `200`
    * Распарсил JSON ответ
    * Запомнил id созданного или измененного животного
    * Отправил PUT запрос на URL `https://petstore.swagger.io/v2/pet` c сохраненным id и параметрами:
      | key           | value   |
      | id            |         |
      | category id   | invalid |
      | category name | updated |
      | name          | updated |
      | photoUrls     | updated |
      | tags id       | 2       |
      | tags name     | updated |
      | status        | sold    |
    * Убедился, что код REST ответа = `405`
    * Удалил животное по сохраненному id


  Сценарий: Обновление информации о животном с указанием невалидного параметра tags id возвращает код ответа 405
    * Создал животное
    * Убедился, что код REST ответа = `200`
    * Распарсил JSON ответ
    * Запомнил id созданного или измененного животного
    * Отправил PUT запрос на URL `https://petstore.swagger.io/v2/pet` c сохраненным id и параметрами:
      | key           | value   |
      | id            |         |
      | category id   | 2       |
      | category name | updated |
      | name          | updated |
      | photoUrls     | updated |
      | tags id       | invalid |
      | tags name     | updated |
      | status        | sold    |
    * Убедился, что код REST ответа = `405`
    * Удалил животное по сохраненному id


  Сценарий: Обновление информации о животном с указанием невалидного параметра status возвращает код ответа 405
    * Создал животное
    * Убедился, что код REST ответа = `200`
    * Распарсил JSON ответ
    * Запомнил id созданного или измененного животного
    * Отправил PUT запрос на URL `https://petstore.swagger.io/v2/pet` c сохраненным id и параметрами:
      | key           | value   |
      | id            |         |
      | category id   | 2       |
      | category name | updated |
      | name          | updated |
      | photoUrls     | updated |
      | tags id       | 2       |
      | tags name     | updated |
      | status        | invalid |
    * Убедился, что код REST ответа = `405`
    * Удалил животное по сохраненному id