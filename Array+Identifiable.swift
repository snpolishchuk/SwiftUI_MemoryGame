//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Oleksandr Polishchuk on 18.01.2021.
//

import Foundation

extension Array where Element: Identifiable {
//    let indexOptional = items.firstIndex { tempItem in
//        tempItem.id == item.id
//    }
    func firstIndex(matching: Element) -> Int {
        for index in 0..<count {
            if self[index].id == matching.id {
                return index
            }
        }
        return 0
    }
}
