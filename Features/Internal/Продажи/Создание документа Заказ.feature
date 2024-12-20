﻿#language: ru

@tree

Функционал: создание документа Заказ.

Как Менеджер я хочу
создать документ Заказ
чтобы оформить заказ на продукцию     

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: проверить расчет итоговой суммы при изменении в строке товаров количества и цены
// создание
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю "Продажи" "Заказы"
	Тогда открылось окно "Заказы товаров"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно "Заказ (создание)"
* Заполнение шапки документа
	И заполнение шапки документа
* Заполнение товарной части
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	Тогда открылось окно "Товары"
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000025" | "Пинетки"      |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Заказ (создание) *"
	И в таблице 'Товары' я завершаю редактирование строки
	И я нажимаю на кнопку "Записать"
* Проверить расчет итоговой суммы при изменении в строке товаров количества и цены, проверка расчета поля Количество
	Когда открылось окно "Заказ * от *"
	И в таблице 'Товары' я выбираю текущую строку
	И в таблице 'Товары' в поле с именем 'ТоварыЦена' я ввожу текст "2 000,00"
	И проверить, что поле Количество заполнилось
	Тогда таблица 'Товары' стала равной:
		| 'Сумма'    |
		| '4 000,00' |
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна "Заказ (создание) *" в течение 20 секунд

Сценарий: проверить возможность заполнения поля Количество при добавлении Услуги
* Открытие заказа
	Когда открылось окно "Заказы товаров"
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Заказ * от *"
* Заполнение товарной части
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	Тогда открылось окно "Товары"
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000038" | "Ремонт"       |
	И в таблице 'Список' я выбираю текущую строку
* Проверить возможность заполнения поля Количество при добавлении Услуги
	Тогда открылось окно "Заказ * от * *"
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' я выбираю текущую строку
	И таблица 'Товары' содержит строки:
		| 'Товар'  | 'Количество' |
		| 'Ремонт' | ''           |
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна "Заказ * от * *" в течение 20 секунд


	
	