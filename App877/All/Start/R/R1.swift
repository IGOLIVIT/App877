//
//  R1.swift
//  App877
//
//  Created by IGOR on 01/10/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("R1")
                    .resizable()
                
                    .ignoresSafeArea()
                
                VStack(spacing: 9) {
                    
                    Text("Watch what you take")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                    
                    Text("Write down the names and additions")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        R2()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim")))
                        
                    })
                }
                .padding(.vertical, 30)
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .background(RoundedRectangle(cornerRadius: 0).fill(Color("bg2")))
            }
            .ignoresSafeArea()

        }
    }
}

#Preview {
    R1()
}
