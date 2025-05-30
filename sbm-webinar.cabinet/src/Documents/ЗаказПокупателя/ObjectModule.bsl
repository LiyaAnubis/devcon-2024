
&После("ПриЗаписи")
Процедура ЛКК_ПриЗаписи(Отказ)
	
	Если ОбменДанными.Загрузка Тогда
		Возврат;
	КонецЕсли;
	
	Если Загружен() Тогда
		Запись = РегистрыСведений.ЛКК_СтатусыЗаказов.СоздатьМенеджерЗаписи();
		Запись.Заказ = Ссылка;
		Запись.Статус = ЛКК_СтатусЗаказа;
		Запись.Записать();
	КонецЕсли;
	
КонецПроцедуры

Функция Загружен()
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ЛКК_ЗагруженныеЗаказы.Заказ КАК Заказ
		|ИЗ
		|	РегистрСведений.ЛКК_ЗагруженныеЗаказы КАК ЛКК_ЗагруженныеЗаказы
		|ГДЕ
		|	ЛКК_ЗагруженныеЗаказы.Заказ = &Заказ";
	Запрос.УстановитьПараметр("Заказ", Ссылка);
	
	Возврат Не Запрос.Выполнить().Пустой();
	
КонецФункции
