//
//  ContentView.swift
//  Realm SwiftUI Simple List
//
//  Created by Jay Wooten on 7/12/24.
//

import SwiftUI
import RealmSwift

struct ContentView: View {

    @ObservedResults(Item.self) var items
    @State var selectedItem: Item?

    var body: some View {
        List(items, selection: $selectedItem) {
            ItemRow(item: $0)
                .tag($0)
        }
        .padding()

        HStack {
            Button(action: {
                let item = Item()
                item.itemName = "\(randomAdjectives.randomElement()!) \(randomNouns.randomElement()!)"
                $items.append(item)
            }, label: {
                Label("Add Item", systemImage: "plus.circle")
            })
            .padding()

            Button(action: {
                if let maybeItem = selectedItem {
                    let thawedItem = maybeItem.thaw()
                    let thawedRealm = thawedItem?.realm!.thaw()
                    try! thawedRealm?.write {
                        thawedRealm?.delete(thawedItem!)
                    }
                    selectedItem = nil
                }
            }, label: {
                Label("Remove Item", systemImage: "minus.circle")
            })
            .padding()
            .disabled( selectedItem == nil )
            
            Button("Delete Item!", role: .destructive) {
                $items.remove(selectedItem!)
                selectedItem = nil
            }
            .padding()
            .disabled( selectedItem == nil )
        }
    }
}

#Preview {
    ContentView()
}
