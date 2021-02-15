//
//  znakZodiacModel.swift
//  ChinaZodiac
//
//  Created by Andy Dvoytsov on 08.02.2021.
//

import Foundation

struct ZodiacInterval { // структура для интервалов дат
    var firstDay:   Int = 0
    var firstMonth: Int = 0
    var lastDay:    Int = 0
    var lastMonth:  Int = 0
}

struct ZnakZodiacModel { // работа со знаками Зодиака
    let znakZodiac = ["Козерог", "Водолей", "Рыбы", "Овен", "Телец", "Близнецы", "Рак", "Лев", "Дева", "Весы", "Скорпион", "Стрелец"]
    let name = "Знаки Зодиака" // заголовок экрана
    let znakDate = ["23 декабря – 20 января", "21 января – 19 февраля", "20 февраля – 20 марта", "21 марта – 20 апреля", "21 апреля – 21 мая", "22 мая – 21 июня", "22 июня – 22 июля", "23 июля – 21 августа", "22 августа – 23 сентября", "24 сентября – 23 октября", "24 октября – 22 ноября", "23 ноября – 22 декабря"] // массив дат
    let zodiacInterval: [ZodiacInterval] = [ // для рассчета временнЫх интервалов
        ZodiacInterval(firstDay: 01, firstMonth: 01, lastDay: 20, lastMonth: 01),
        ZodiacInterval(firstDay: 21, firstMonth: 01, lastDay: 19, lastMonth: 02),
        ZodiacInterval(firstDay: 20, firstMonth: 02, lastDay: 20, lastMonth: 03),
        ZodiacInterval(firstDay: 21, firstMonth: 03, lastDay: 20, lastMonth: 04),
        ZodiacInterval(firstDay: 21, firstMonth: 04, lastDay: 21, lastMonth: 05),
        ZodiacInterval(firstDay: 22, firstMonth: 05, lastDay: 21, lastMonth: 06),
        ZodiacInterval(firstDay: 22, firstMonth: 06, lastDay: 22, lastMonth: 07),
        ZodiacInterval(firstDay: 23, firstMonth: 07, lastDay: 21, lastMonth: 08),
        ZodiacInterval(firstDay: 22, firstMonth: 08, lastDay: 23, lastMonth: 09),
        ZodiacInterval(firstDay: 24, firstMonth: 09, lastDay: 23, lastMonth: 10),
        ZodiacInterval(firstDay: 24, firstMonth: 10, lastDay: 22, lastMonth: 11),
        ZodiacInterval(firstDay: 23, firstMonth: 11, lastDay: 22, lastMonth: 12),
        ZodiacInterval(firstDay: 23, firstMonth: 12, lastDay: 31, lastMonth: 12)
    ]
    
    func getImageName(index: Int) -> String { // узнаем путь к рисунку по номеру
        return "z\(index+1).png" // имя картинки - порядковый номер
    }
    
    func getZnakByDate(date: Date) -> Int { // узнаем знак Зодиака по дате
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        var dateComponents = DateComponents()
        var num: Int = 0
        
        dateComponents.year = 2016 // все рассчеты ведем для условного 2016-го года
        dateComponents.month = month
        dateComponents.day = day
        let userDate = calendar.date(from: dateComponents) // пользовательская дата, но год 2016-й для сравнения с интервалами
        
        for i in 0...zodiacInterval.count - 1 {
            // находим начало интервала даты для знака Зокиака
            dateComponents.month = zodiacInterval[safe: i]?.firstMonth
            dateComponents.day = zodiacInterval[safe: i]?.firstDay
            let firstDate = calendar.date(from: dateComponents)
            // находим конец интервала даты для знака Зокиака
            dateComponents.month = zodiacInterval[safe: i]?.lastMonth
            dateComponents.day = zodiacInterval[safe: i]?.lastDay
            let lastDate = calendar.date(from: dateComponents)
            // проверяем попадает ли заданная пользователем дата в интервал
            if (userDate! >= firstDate!) && (userDate! <= lastDate!) {
                num = i // если да, запоминаем номер знака
            }
        }
        if num == 12 {
            num = 0 // для козерога 2 интервала - в начале года и в конце
        }
        return num
    }
}
