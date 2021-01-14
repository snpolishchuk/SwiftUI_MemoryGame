//
//  Grid.swift
//  Memorize
//
//  Created by Oleksandr Polishchuk on 24.12.2020.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }

    var body: some View {
        GeometryReader { geometry in
            ForEach(items) { item in
                viewForItem(item)
            }
        }
    }
}
