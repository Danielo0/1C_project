﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр РеализацияРабот Приход
	Движения.РеализацияРабот.Записывать = Истина;
	Для Каждого ТекСтрокаУслуги Из Услуги Цикл
		Движение = Движения.РеализацияРабот.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Проект = Ссылка;
		Движение.Номенклатура = ТекСтрокаУслуги.Номенклатура;
		Движение.Часы = ТекСтрокаУслуги.Трудоемкость;
	КонецЦикла;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры
