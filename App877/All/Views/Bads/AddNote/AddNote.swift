//
//  AddNote.swift
//  App877
//
//  Created by IGOR on 10/10/2024.
//

import SwiftUI

struct AddNote: View {

    @StateObject var viewModel: BadsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg3")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Desires")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .medium))
                    .padding(.vertical)
                
                Menu(content: {
                    
                    ForEach(viewModel.images, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.currentIm = index
                            
                        }, label: {
                            
                            Image(index)
                        })
                    }
                    
                }, label: {
                    
                    if viewModel.currentIm.isEmpty {
                        
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color("prim"))
                            .frame(width: 60)
                            .frame(maxWidth: .infinity)
                            .frame(height: 180)
                            .background(RoundedRectangle(cornerRadius: 30).stroke(Color("prim")))
                        
                        
                    } else {
                        
                        Image(viewModel.currentIm)
                            .resizable()
                            .frame(height: 180)
                            .frame(maxWidth: .infinity)
                        
                    }
                    
                })
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Text("Name")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.notName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.notName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)
                        .padding(.bottom)
                                                    
                            Text("Subtitle")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)

                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.notSub.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.notSub)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                            .padding(1)
                            .padding(.bottom)
                        
                        Text("Text")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.notTxt.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.notTxt)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)
                        .padding(.bottom, 20)
                        
                        Button(action: {
                            
                            viewModel.notPhoto = viewModel.currentIm
                            
                            viewModel.addNote()
                            
                            viewModel.notName = ""
                            viewModel.notSub = ""
                            viewModel.notTxt = ""
                            
                            viewModel.fetchNotes()
                            
                            viewModel.currentIm = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
                        })
                        .opacity(viewModel.notName.isEmpty || viewModel.notTxt.isEmpty || viewModel.notSub.isEmpty ? 0.5 : 1)
                        
                        Button(action: {
                            
                            viewModel.notName = ""
                            viewModel.notSub = ""
                            viewModel.notTxt = ""
                            
                            viewModel.currentIm = ""
                                                        
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .background(RoundedRectangle(cornerRadius: 25.0).stroke(Color("prim")))
                        })
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddNote(viewModel: BadsViewModel())
}
