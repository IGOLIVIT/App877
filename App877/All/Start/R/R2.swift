//
//  R2.swift
//  App877
//
//  Created by IGOR on 01/10/2024.
//

import SwiftUI

struct R2: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("R2")
                    .resizable()
                
                    .ignoresSafeArea()
                
                VStack(spacing: 9) {
                    
                    Text("Fill out the pages")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                    
                    Text("Add descriptions and instructions to them")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                    
                    Spacer()
                    
                    Button(action: {
                        
                       status = true
                        
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
    R2()
}
