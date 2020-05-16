﻿
&НаСервере
Процедура ДобавитьЗадачиИзПроектаНаСервере()
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	РеализацияРаботОстатки.Номенклатура КАК Номенклатура,
		|	РеализацияРаботОстатки.ЧасыОстаток КАК ЧасыОстаток
		|ИЗ
		|	РегистрНакопления.РеализацияРабот.Остатки(, Проект = &Проект) КАК РеализацияРаботОстатки";
	
	Запрос.УстановитьПараметр("Проект", Объект.Проект);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выгрузить();
	
	Объект.Услуги.Очистить();
	
	Для каждого СтрокаВыборки из ВыборкаДетальныеЗаписи Цикл
		НоваяСтрока = Объект.Услуги.Добавить();
		НоваяСтрока.Номенклатура = СтрокаВыборки.Номенклатура;
		НоваяСтрока.Трудоемкость = СтрокаВыборки.ЧасыОстаток;
		НоваяСтрока.ТрудоемкостьЭталон = СтрокаВыборки.ЧасыОстаток;
		НоваяСтрока.ФактТрудоемкость = СтрокаВыборки.ЧасыОстаток;
	КонецЦикла;
	
	ИтогТаблицы = Объект.Услуги.Итог("НомерСтроки");
	Если ИтогТаблицы Тогда
		Сообщить("Нет задач для выполнения");
	КонецЕсли;

	
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьЗадачиИзПроекта(Команда)
	ДобавитьЗадачиИзПроектаНаСервере();
КонецПроцедуры


&НаКлиенте
Процедура УслугиТрудоемкостьПриИзменении(Элемент)
	ТекСтрока = ТекущийЭлемент.ТекущиеДанные;
	
	Если ТекСтрока.Трудоемкость > ТекСтрока.ТрудоемкостьЭталон Тогда
		ТекСтрока.Трудоемкость = ТекСтрока.ТрудоемкостьЭталон;
		Сообщить("Трудоемкость данной задачи не может быть больше общей оставшейся трудоемкости");
	КонецЕсли	
КонецПроцедуры



