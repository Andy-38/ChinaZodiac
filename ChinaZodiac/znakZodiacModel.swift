//
//  znakZodiacModel.swift
//  ChinaZodiac
//
//  Created by Andy Dvoytsov on 08.02.2021.
//

import Foundation

struct ZodiacInterval {
    var firstDay:   Int = 0
    var firstMonth: Int = 0
    var lastDay:    Int = 0
    var lastMonth:  Int = 0
}

struct ZnakZodiacModel { // работа со знаками Зодиака
    let znakZodiac = ["Козерог", "Водолей", "Рыбы", "Овен", "Телец", "Близнецы", "Рак", "Лев", "Дева", "Весы", "Скорпион", "Стрелец"]
    let name = "Знаки Зодиака" // заголовок экрана
    let znakDate = ["23 декабря – 20 января", "21 января – 19 февраля", "20 февраля – 20 марта", "21 марта – 20 апреля", "21 апреля – 21 мая", "22 мая – 21 июня", "22 июня – 22 июля", "23 июля – 21 августа", "22 августа – 23 сентября", "24 сентября – 23 октября", "24 октября – 22 ноября", "23 ноября – 22 декабря"] // массив дат
    let zodiacInterval: [ZodiacInterval] = [
        ZodiacInterval(firstDay: 21, firstMonth: 1, lastDay: 19, lastMonth: 2),
        ZodiacInterval(firstDay: 20, firstMonth: 2, lastDay: 20, lastMonth: 3),
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
        
        dateComponents.year = 2016
        dateComponents.month = month
        dateComponents.day = day
        let userDate = calendar.date(from: dateComponents)
       
        for i in 0...zodiacInterval.count - 1 {
       
        dateComponents.year = 2016
        dateComponents.month = zodiacInterval[i].firstMonth
        dateComponents.day = zodiacInterval[i].firstDay
        let firstDate = calendar.date(from: dateComponents)
        
        dateComponents.year = 2016
        dateComponents.month = zodiacInterval[i].lastMonth
        dateComponents.day = zodiacInterval[i].lastDay
        let lastDate = calendar.date(from: dateComponents)
        
        if (userDate! >= firstDate!) && (userDate! <= lastDate!) {
            num = i + 1
        }
        }
        
        return num
    }
}
