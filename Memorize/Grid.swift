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

    var body: some View {
        GeometryReader { geometry in
            ForEach(items) { item in
                viewForItem(item)
            }
        }
    }
}
