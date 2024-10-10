//
//  ContentView.swift
//  App877
//
//  Created by IGOR on 01/10/2024.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            if status {
            
                HomeView(mainModel: ArticlesViewModel())
                
            } else {
                
                R1()
            }
        }
    }
}

#Preview {
    ContentView()
}
