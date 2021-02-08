//
//  znakZodiacModel.swift
//  ChinaZodiac
//
//  Created by Andy Dvoytsov on 08.02.2021.
//

import Foundation

struct ZnakZodiacModel { // работа со знаками Зодиака
    let znakZodiac = ["Козерог", "Водолей", "Рыбы", "Овен", "Телец", "Близнецы", "Рак", "Лев", "Дева", "Весы", "Скорпион", "Стрелец"]
    let name = "Знаки Зодиака" // заголовок экрана
    
    func getImageName(index: Int) -> String { // узнаем путь к рисунку по номеру
        return "z\(index+1).png" // имя картинки - порядковый номер
    }
}
