# encoding: UTF-8
# language: ru

@all @user
Функционал: Создание пользователя. https://petstore.swagger.io/#/user/createUser


  Сценарий: Создание пользователя со случайным id
    * Отправил POST запрос для создания пользователя на URL `https://petstore.swagger.io/v2/user` c параметрами:
      | key           | value       |
      | [:id]         |             |
      | [:username]   | iprusername |
      | [:firstName]  | string      |
      | [:lastName]   | string      |
      | [:email]      | string      |
      | [:password]   | string      |
      | [:phone]      | string      |
      | [:userStatus] | 0           |
    * Убедился, что код REST ответа = `200`
    * Распарсил JSON ответ
    * Запомнил id и username созданного пользователя
    * Убедился, что есть пользователь с сохраненным id по сохраненному username
    * Удалил пользователся по сохраненному username
    * Убедился, что удалил пользователся по сохраненному username


  Сценарий: Создание пользователя по свободного id
    * Создал пользователя со случайными id и username
    * Убедился, что код REST ответа = `200`
    * Распарсил JSON ответ
    * Запомнил id и username созданного пользователя
    * Убедился, что есть пользователь с сохраненным id по сохраненному username
    * Удалил пользователся по сохраненному username
    * Убедился, что удалил пользователся по сохраненному username
    * Создал пользователя с сохраненным id и случайным username
    * Убедился, что код REST ответа = `200`
    * Распарсил JSON ответ
    * Убедился, что отправленный и полученный id совпадают
    * Запомнил id и username созданного пользователя
    * Убедился, что есть пользователь с сохраненным id по сохраненному username
    * Удалил пользователся по сохраненному username
    * Убедился, что удалил пользователся по сохраненному username


  Сценарий: Создание пользователя по занятому username возвращает ошибку
    * Создал пользователя со случайными id и username
    * Убедился, что код REST ответа = `200`
    * Распарсил JSON ответ
    * Запомнил id и username созданного пользователя
    * Убедился, что есть пользователь с сохраненным id по сохраненному username
    * Создал пользователя с сохраненным username
    * Убедился, что код REST ответа = `400`


  Сценарий: Создание пользователя по занятому id возвращает ошибку
    * Создал пользователя со случайными id и username
    * Убедился, что код REST ответа = `200`
    * Распарсил JSON ответ
    * Запомнил id и username созданного пользователя
    * Убедился, что есть пользователь с сохраненным id по сохраненному username
    * Создал пользователя с сохраненным id и случайным username
    * Убедился, что код REST ответа = `400`


  Сценарий: Создание пользователя с невалидным id возвращает ошибку
    * Отправил POST запрос для создания пользователя на URL `https://petstore.swagger.io/v2/user` c параметрами:
      | key           | value       |
      | [:id]         | invalid_id  |
      | [:username]   | iprusername |
      | [:firstName]  | string      |
      | [:lastName]   | string      |
      | [:email]      | string      |
      | [:password]   | string      |
      | [:phone]      | string      |
      | [:userStatus] | 0           |
    * Убедился, что код REST ответа = `400`


  Сценарий: Создание пользователя с невалидным userStatus возвращает ошибку
    * Отправил POST запрос для создания пользователя на URL `https://petstore.swagger.io/v2/user` c параметрами:
      | key           | value               |
      | [:id]         |                     |
      | [:username]   | iprusername         |
      | [:firstName]  | string              |
      | [:lastName]   | string              |
      | [:email]      | string              |
      | [:password]   | string              |
      | [:phone]      | string              |
      | [:userStatus] | invalid_ userStatus |
    * Убедился, что код REST ответа = `400`