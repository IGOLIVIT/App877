//
//  NoteDetail.swift
//  App877
//
//  Created by IGOR on 10/10/2024.
//

import SwiftUI

struct NoteDetail: View {
    
    @StateObject var viewModel: BadsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg3")
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 17, weight: .medium))
                        
                        Text("Back")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 15, weight: .regular))
                    })
                    
                    Spacer()
                }
            .padding(.vertical, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading) {
                        
                        Text(viewModel.selectedNote?.notName ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 32, weight: .medium))
                            .padding(.vertical, 40)
                        
                        Image(viewModel.selectedNote?.notPhoto ?? "")
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .frame(height: 220)
                        
                        Text(viewModel.selectedNote?.notSub ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .medium))
                        
                        Text(viewModel.selectedNote?.notTxt ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                        
                    }
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    NoteDetail(viewModel: BadsViewModel())
}
