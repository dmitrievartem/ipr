# encoding: UTF-8
# language: ru

@all @deleteOrder
Функционал: Удаление заказа на животное. https://petstore.swagger.io/#/store/deleteOrder


  Сценарий: Удаление заказа на животное
    * Создал заказ на животное
    * Убедился, что код REST ответа = `200`
    * Распарсил JSON ответ
    * Запомнил id созданного заказа
    * Отправил DELETE запрос на URL `https://petstore.swagger.io/v2/store/order` c сохраненным id заказа
    * Убедился, что код REST ответа = `200`


  Сценарий: Запрос на удаление заказа на животное с невалидным id возвращает код ответа 400
    * Отправил DELETE запрос на URL `https://petstore.swagger.io/v2/store/order` c path параметром `invalid_id`
    * Убедился, что код REST ответа = `400`


  Сценарий: Запрос на удаление заказа на животное с несуществующим id возвращает код ответа 404
    * Отправил DELETE запрос на URL `https://petstore.swagger.io/v2/store/order` c path параметром `435756673567`
    * Убедился, что код REST ответа = `404`
