-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 24 2020 г., 08:21
-- Версия сервера: 5.6.47
-- Версия PHP: 7.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test_arvis`
--

-- --------------------------------------------------------

--
-- Структура таблицы `branch`
--

CREATE TABLE `branch` (
  `id` int(10) NOT NULL,
  `id_company` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `branch`
--

INSERT INTO `branch` (`id`, `id_company`, `name`, `address`) VALUES
(1, 1, 'Роснефть', 'Россия: Москва'),
(2, 1, 'Газпромбанк', 'Россия: Москва'),
(3, 1, 'Газпромнефть', 'Россия: Москва');

-- --------------------------------------------------------

--
-- Структура таблицы `company`
--

CREATE TABLE `company` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `company`
--

INSERT INTO `company` (`id`, `name`, `address`) VALUES
(1, 'ПАО «Газпро́м»', 'Россия: Москва');

-- --------------------------------------------------------

--
-- Структура таблицы `staff`
--

CREATE TABLE `staff` (
  `id` int(10) NOT NULL,
  `id_branch` int(10) NOT NULL,
  `fio` varchar(50) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `position` varchar(150) NOT NULL,
  `category` enum('itr','ordinary employees') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `staff`
--

INSERT INTO `staff` (`id`, `id_branch`, `fio`, `gender`, `position`, `category`) VALUES
(1, 1, 'Захаров Владислав Евгеньевич', 'male', 'Программист', 'ordinary employees'),
(2, 1, 'Халепо Ольга Анатольевна', 'female', 'Главный бухгалтер', 'ordinary employees'),
(3, 2, 'Халепо Эдуард Викторович', 'male', 'Системный администратор', 'itr'),
(4, 2, 'Козлов Михаил Анатольевич', 'male', 'Контрактный управляющий', 'ordinary employees'),
(5, 3, 'Козлова Елена Викторовна', 'female', 'Заведующий АХЧ', 'itr'),
(6, 3, 'Миленина Антонина Алексеевна', 'female', 'Заместитель директора по общим вопросам', 'ordinary employees'),
(9, 1, 'Автомаров Олег Алексеевич', 'male', 'Водитель', 'ordinary employees'),
(10, 1, 'Вильданов Владислав Васильевич', 'male', 'Рабочий', 'itr');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_company` (`id_company`);

--
-- Индексы таблицы `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_branch` (`id_branch`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `company`
--
ALTER TABLE `company`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`id_company`) REFERENCES `company` (`id`);

--
-- Ограничения внешнего ключа таблицы `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`id_branch`) REFERENCES `branch` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
