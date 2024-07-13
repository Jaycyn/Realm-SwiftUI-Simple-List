//
//  Realm_SwiftUI_Simple_ListApp.swift
//  Realm SwiftUI Simple List
//
//  Created by Jay Wooten on 7/12/24.
//

import SwiftUI
import RealmSwift

@main
struct Realm_SwiftUI_Simple_ListApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.realmConfiguration, Realm.Configuration( fileURL: getRealmPath() ))
                .frame(width: 700, height: 300)
        }
        .windowResizability(.contentSize)
    }


    func getRealmPath() -> URL {
        let path = #file
        let url = URL(fileURLWithPath: path)
        let projectSubFolder = url.deletingLastPathComponent()
        let projectFolder = projectSubFolder.deletingLastPathComponent()
        let pathToThisRealmFile = projectFolder.appending(path: "default.realm")
        print("Your local only realm file is stored here: \n\(pathToThisRealmFile)")

        return pathToThisRealmFile
    }
}
