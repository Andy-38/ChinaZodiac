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
    
    func getImageName(index: Int) -> String { // узнаем путь к рисунку по номеру
        return "\(index+1).png" // имя картинки - порядковый номер
    }
    
    func getNearestYear(offset: Int) -> Int { // ближайщий год для выбранного животного
        return firstYear + offset
    }
    
    func getAnimalNumByYear(year: Int) -> Int { // узнаем животное по году
        return year % 12
    }
}
