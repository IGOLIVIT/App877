//
//  HomeViewModel.swift
//  App877
//
//  Created by IGOR on 01/10/2024.
//

import SwiftUI

final class HomeViewModel: ObservableObject {

    @AppStorage("name") var name: String = ""
    @AppStorage("photo") var photo: String = ""
    
    @AppStorage("protein") var protein: Double = Double(.random(in: 1...20))
    @AppStorage("amino") var amino: Double = Double(.random(in: 1...20))
    @AppStorage("vitamins") var vitamins: Double = Double(.random(in: 1...20))
    @AppStorage("creatine") var creatine: Double = Double(.random(in: 1...20))
    @AppStorage("chromium") var chromium: Double = Double(.random(in: 1...20))

    @AppStorage("gr") var gr: Int = 0

    @Published var enterName: String = ""
    @Published var enterPhoto: String = ""

    @Published var photos: [String] = ["avatar"]
    
    @Published var isProfile: Bool = false
    @Published var isArticles: Bool = false
    @Published var isBads: Bool = false
    @Published var isSettings: Bool = false

}

