//
//  SafeIndex.swift
//  ChinaZodiac
//
//  Created by Andy Dvoytsov on 08.02.2021.
//

import Foundation

extension Collection { // расширение для массивов, чтобы безопасно возвращать элемент по индексу
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
