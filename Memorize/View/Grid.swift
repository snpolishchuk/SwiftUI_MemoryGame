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
            let layout = GridLayout(itemCount: items.count, in: geometry.size)
            body(for: layout)
        }
    }
    
    func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            body(for: item, in: layout)
        }
    }
    
    func body(for item: Item, in layout: GridLayout) -> some View {
        Group {
            if let index = items.firstIndex(matching: item) {
                viewForItem(item)
                    .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                    .position(layout.location(ofItemAt: index))
            }
        }
    }
}
