//
//  LoadingView.swift
//  App877
//
//  Created by IGOR on 01/10/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("Llogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding()
            }
        }

    }
}

#Preview {
    LoadingView()
}
