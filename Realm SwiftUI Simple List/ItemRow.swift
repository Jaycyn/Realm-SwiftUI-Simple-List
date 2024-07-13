//
//  ItemRow.swift
//  Realm SwiftUI Simple List
//
//  Created by Jay Wooten on 7/12/24.
//

import SwiftUI

struct ItemRow: View {
    var item: Item

    var body: some View {
        VStack(alignment: .leading) {
            Text(item.itemName)
        }
    }
}

#Preview {
    ItemRow(item: Item() )
}
