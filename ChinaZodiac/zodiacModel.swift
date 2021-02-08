//
//  zodiacModel.swift
//  ChinaZodiac
//
//  Created by Andy Dvoytsov on 08.02.2021.
//

import Foundation

struct ZodiacModel { // работа с зодиакальными животными по китайскому календарю
    let animalsZodiac = ["Обезьяна", "Петух", "Собака", "Свинья (Кабан)", "Крыса (Мышь)", "Бык", "Тигр", "Кролик (Кот)", "Дракон", "Змея", "Лошадь", "Коза (Овца)"]
    let name = "Символы года" // заголовок экрана
    let firstYear: Int = 2016 // первый ближайщий год обезьяны
    let maxYears = 10 // максимальное количество посчитанных лет для выбранного животного в одну сторону (прошлое/будущее)
    var numberOfElements: Int { // количество годов отображаемых для выбранного животного
        maxYears * 2 + 1
    }
    var years = [Int] () // массив годов для выбранного животного
    
    func getImageName(index: Int) -> String { // узнаем путь к рисунку по номеру
        return "\(index+1).png" // имя картинки - порядковый номер
    }
    
    func getNearestYear(offset: Int) -> Int { // ближайщий год для выбранного животного
        return firstYear + offset
    }
    
    func getAnimalNumByYear(year: Int) -> Int { // узнаем животное по году
        return year % 12
    }
    
    mutating func getYearsArray(year: Int) { // заполняем массив годов для выбранного животного
        for i in 0...maxYears - 1 {
            years.append(year + 12 * (i - maxYears))
        } // года до текущего
        years.append(year) // текущий год
        for i in 0...maxYears - 1 {
            years.append(year + 12 * (i + 1))
        } // года после текущего
    }
}
