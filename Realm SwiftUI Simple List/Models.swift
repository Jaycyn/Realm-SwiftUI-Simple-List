//
//  Models.swift
//  Realm SwiftUI Simple List
//
//  Created by Jay Wooten on 7/12/24.
//

import RealmSwift


class Item: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var itemName = ""
}
