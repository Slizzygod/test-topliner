## Описание тестового задания

Тестовое задание, не сложное:
Описание задачи:
Есть главное предприятие, у него три (и больше) филиала, в каждом филиале некоторое количество работников, работники делятся на ИТР и рядовых сотрудников.
Нужно сделать программу, которая:
1. Выдает список всех филиалов, у каждого кнопка подробнее
2. При нажатии на Подробнее открывается список сотрудников филиала и информация о филиале, список отсортирован алфавитно, с указанием должности.
 
Для этого:
1. Нужно создать БД, просто sql код или UML схема
2. Написать программу на PHP
3. Написать вывод на экран
 
Плюсом будет, но не обязательно
1. Написание классов PHPUnit
2. Документирование кода
3. Вывод информации о филиалах и сотрудниках без перезагрузки экрана

## Тестовое написано с использованием стака React + PHP 7.3 + MySQL
Для того, чтобы запустить проект необходимо:
1. Клонировать репозиторий $ git clone https://github.com/Slizzygod/test-topliner.git
2. Установить зависимости реакта $ npm install
3. Выкинуть {backend} на сервер
4. Импортировать БД test_arvis.sql
5. Подключиться к Бд с использованием интерфейса $db->getConnection();
6. В fetch запросах прописать пути до обработчиков
   6.1 {method: 'GET'} http://test-arvis/api/branchList/              Возвращает список филиалов
   6.2 {method: 'GET'} http://test-arvis/api/staffList/?id=1          Возвращает список сотрудников филиала и информацию о филиале. Список отсортирован алфавитно, с указанием     должности
  
## Тестирование
Тестирование запросов проводилось с использованием postman

### p.s. Данное тестовое можно было выполнить несколькими вариантами, а именно:
1. Вместо React'a использовать js + fetch(es6), либо js + jquery(ajax) для асинхронных запросов, я же решил показать свои умения в React'e.
2. Backend api с использованием фреймворков (Laravel, Yii2), я же решил показать свои умения в чистом php + запросах/многомерных запросах SQL
