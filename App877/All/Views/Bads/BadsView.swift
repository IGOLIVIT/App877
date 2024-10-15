//
//  BadsView.swift
//  App877
//
//  Created by IGOR on 01/10/2024.
//

import SwiftUI

struct BadsView: View {
    
    @StateObject var viewModel = BadsViewModel()
    @StateObject var mainModel: HomeViewModel
    @Environment(\.presentationMode) var router

    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {

                        mainModel.isBads = false
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
                    
                    LazyVStack {
                        
                        ForEach(viewModel.notes, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.selectedNote = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDetail = true
                                }
                                
                            }, label: {
                                
                                VStack(alignment: .leading, spacing: 9) {
                                    
                                    Image(index.notPhoto ?? "")
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 180)
                                    
                                    Text(index.notSub ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 26, weight: .medium))
                                        .multilineTextAlignment(.leading)
                                    
                                    Text(index.notTxt ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                        .multilineTextAlignment(.leading)
                                }
                            })
                        }
                        
                    }
                }
                
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .semibold))
                        .frame(width: 50, height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                .padding(.bottom, 100)
            }
        }
        .onAppear {
            
            viewModel.fetchNotes()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddNote(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isNot1, content: {
            
            notes1(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isNot2, content: {
            
            notes2(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            NoteDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    BadsView(mainModel: HomeViewModel())
}
