# encoding: UTF-8
# language: ru

@all @placeOrder
Функционал: Создание заказа на животное. https://petstore.swagger.io/#/store/placeOrder


  Структура сценария: Запрос на создание заказа на животное
    * Отправил POST запрос для создания заказа на URL `https://petstore.swagger.io/v2/store/order` c параметрами:
      | key         | value                    |
      | [:id]       | 9999                     |
      | [:petId]    | 9999456                  |
      | [:quantity] | 1                        |
      | [:shipDate] | 2021-04-24T17:01:30.009Z |
      | [:status]   | <status>                 |
      | [:complete] | <complete>               |
    * Убедился, что код REST ответа = `200`
    * Распарсил JSON ответ
    * Запомнил id созданного заказа
    * Убедился, что заказ в ответе соответствует запросу по сохраненному id
    * Отправил DELETE запрос на URL `https://petstore.swagger.io/v2/store/order` c сохраненным id заказа
#   id животного должен быть реальный
#   убедиться что такое животное есть
#   для невалидного id должен быть  invalid order 400
    Примеры:
      | status    | complete |
      | placed    | true     |
      | approved  | true     |
      | delivered | true     |
      | placed    | false    |
      | approved  | false    |
      | delivered | false    |

#
#  Проверить коды. 500
#



  Сценарий: Запрос на создание заказа на животное c невалидным параметром id возвращает код ответа 500
    * Отправил POST запрос для создания заказа на URL `https://petstore.swagger.io/v2/store/order` c параметрами:
      | key         | value                    |
      | [:id]       | invalid                  |
      | [:petId]    | 1                        |
      | [:quantity] | 1                        |
      | [:shipDate] | 2021-04-24T17:01:30.009Z |
      | [:status]   | placed                   |
      | [:complete] | true                     |
    * Убедился, что код REST ответа = `500`


  Сценарий: Запрос на создание заказа на животное c невалидным параметром petId возвращает код ответа 500
    * Отправил POST запрос для создания заказа на URL `https://petstore.swagger.io/v2/store/order` c параметрами:
      | key         | value                    |
      | [:id]       | 1                        |
      | [:petId]    | invalid                  |
      | [:quantity] | 1                        |
      | [:shipDate] | 2021-04-24T17:01:30.009Z |
      | [:status]   | placed                   |
      | [:complete] | true                     |
    * Убедился, что код REST ответа = `500`


  Сценарий: Запрос на создание заказа на животное c невалидным параметром quantity возвращает код ответа 500
    * Отправил POST запрос для создания заказа на URL `https://petstore.swagger.io/v2/store/order` c параметрами:
      | key         | value                    |
      | [:id]       | 1                        |
      | [:petId]    | 1                        |
      | [:quantity] | invalid                  |
      | [:shipDate] | 2021-04-24T17:01:30.009Z |
      | [:status]   | placed                   |
      | [:complete] | true                     |
    * Убедился, что код REST ответа = `500`


  Сценарий: Запрос на создание заказа на животное c невалидным параметром shipDate возвращает код ответа 500
    * Отправил POST запрос для создания заказа на URL `https://petstore.swagger.io/v2/store/order` c параметрами:
      | key         | value   |
      | [:id]       | 1       |
      | [:petId]    | 1       |
      | [:quantity] | 1       |
      | [:shipDate] | invalid |
      | [:status]   | placed  |
      | [:complete] | true    |
    * Убедился, что код REST ответа = `500`


  Сценарий: Запрос на создание заказа на животное c невалидным параметром status возвращает код ответа 500
    * Отправил POST запрос для создания заказа на URL `https://petstore.swagger.io/v2/store/order` c параметрами:
      | key         | value                    |
      | [:id]       | 1                        |
      | [:petId]    | 1                        |
      | [:quantity] | 1                        |
      | [:shipDate] | 2021-04-24T17:01:30.009Z |
      | [:status]   | invalid                  |
      | [:complete] | true                     |
    * Убедился, что код REST ответа = `500`


  Сценарий: Запрос на создание заказа на животное c невалидным параметром complete возвращает код ответа 500
    * Отправил POST запрос для создания заказа на URL `https://petstore.swagger.io/v2/store/order` c параметрами:
      | key         | value                    |
      | [:id]       | 1                        |
      | [:petId]    | 1                        |
      | [:quantity] | 1                        |
      | [:shipDate] | 2021-04-24T17:01:30.009Z |
      | [:status]   | placed                   |
      | [:complete] | invalid                  |
    * Убедился, что код REST ответа = `500`