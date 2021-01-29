//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Oleksandr Polishchuk on 18.01.2021.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        return firstIndex { item in
            item.id == matching.id
        }
    }
}
 
