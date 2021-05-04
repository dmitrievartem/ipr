# encoding: UTF-8
# language: ru

@all @createWithList
Функционал: Создание списка пользователей. https://petstore.swagger.io/#/user/createUsersWithListInput


  Сценарий: Запрос списком на создание n пользователей со случайными id и username
    * Отправил POST запрос со списком из `3` пользователей на URL `https://petstore.swagger.io/v2/user/createWithList`
    * Убедился, что код REST ответа = `200`
    * Убедился, что существуют пользователи по созданному списку
    * Удалил созданных пользователей по списку
    * Убедился, что нет пользователей по списку имен


  Сценарий: Запрос списком на создание 1 пользователя со случайными id и username
    * Отправил POST запрос со списком из `1` пользователей на URL `https://petstore.swagger.io/v2/user/createWithList`
    * Убедился, что код REST ответа = `200`
    * Убедился, что существуют пользователи по созданному списку
    * Удалил созданных пользователей по списку
    * Убедился, что нет пользователей по списку имен


  Сценарий: Запрос списком на создание 0 пользователей со случайными id и username
    * Отправил POST запрос со списком из `0` пользователей на URL `https://petstore.swagger.io/v2/user/createWithList`
    * Убедился, что код REST ответа = `200`
    * Убедился, что существуют пользователи по созданному списку
    * Удалил созданных пользователей по списку
    * Убедился, что нет пользователей по списку имен


  Сценарий: Запрос списком на создание 2 пользователей, когда для одного из них указаны невалидные данные возвращает ошибку
    * Подготовил список из `2` пользователей
    * Добавил в список невалидного пользователя
      | key           | value          |
      | [:id]         |                |
      | [:username]   | iprusername    |
      | [:firstName]  | string         |
      | [:lastName]   | string         |
      | [:email]      | string         |
      | [:password]   | string         |
      | [:phone]      | string         |
      | [:userStatus] | invalid_status |
    * Отправил POST запрос с подготовленным списком пользователей на URL `https://petstore.swagger.io/v2/user/createWithList`
    * Убедился, что код REST ответа = `500`
    * Убедился, что нет пользователей по списку имен


  Сценарий: Запрос на создание 2х невалидных пользователей
    * Подготовил список из `0` пользователей
    * Добавил в список невалидного пользователя
      | key           | value          |
      | [:id]         |                |
      | [:username]   | iprusername    |
      | [:firstName]  | string         |
      | [:lastName]   | string         |
      | [:email]      | string         |
      | [:password]   | string         |
      | [:phone]      | string         |
      | [:userStatus] | invalid_status |
    * Добавил в список невалидного пользователя
      | key           | value          |
      | [:id]         |                |
      | [:username]   | iprusername    |
      | [:firstName]  | string         |
      | [:lastName]   | string         |
      | [:email]      | string         |
      | [:password]   | string         |
      | [:phone]      | string         |
      | [:userStatus] | invalid_status |
    * Отправил POST запрос с подготовленным списком пользователей на URL `https://petstore.swagger.io/v2/user/createWithList`
    * Убедился, что код REST ответа = `500`
    * Убедился, что нет пользователей по списку имен