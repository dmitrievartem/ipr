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
    * Убедился, что код REST ответа = `200`
    * Распарсил JSON ответ
    * Запомнил id созданного или измененного животного
    * Убедился, что животное в ответе соответствует запросу по сохраненному id
    * Отправил DELETE запрос на URL `https://petstore.swagger.io/v2/pet` c path параметром `45479754`
    * Убедился, что код REST ответа = `200`
    * Убедился, что нет животного с сохраненным id
#    добавить проверку объекта для всех сценариев где есть сравнение
#    добавить get чтобы убедиться что удалилось
#    разобраться как парсим JSON
#    ЖЕЛАТЕЛЬНО парсить JSON в другую переменную


  Сценарий: Запрос на удаление животного по несуществующему id возвращает код ответа 404
#    создавать с рандомным id и удалять его
    * Отправил DELETE запрос на URL `https://petstore.swagger.io/v2/pet` c path параметром `45479754`
    * Убедился, что код REST ответа = `404`


  Сценарий: Запрос на удаление животного по невалидному id возвращает код ответа 400
    * Отправил DELETE запрос на URL `https://petstore.swagger.io/v2/pet` c path параметром `invalid_id`
    * Убедился, что код REST ответа = `400`