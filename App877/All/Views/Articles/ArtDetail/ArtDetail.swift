//
//  ArtDetail.swift
//  App877
//
//  Created by IGOR on 10/10/2024.
//

import SwiftUI

struct ArtDetail: View {

    @StateObject var viewModel: ArticlesViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg3")
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    ZStack {
                        
                        Text(viewModel.selectedArticle?.artName ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
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
                    }
                    .padding(.vertical, 30)
                    
                    HStack {
                        
                        Text(viewModel.selectedArticle?.artName ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                        
                        Spacer()
                        
                        Text(viewModel.selectedArticle?.artType ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular))
                            .padding(7)
                            .padding(.horizontal, 6)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                    }
                    
                    Text("In one serving: \(viewModel.selectedArticle?.artGramm ?? "")")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding(.horizontal)
                .padding(.bottom, 140)
                
                VStack {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack(alignment: .leading, spacing: 17) {
                            
                            Text(viewModel.selectedArticle?.artDescr ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .regular))
                                .padding(.top, 110)
                            
                            VStack(alignment: .leading, spacing: 17) {
                                
                                Text("Instructions")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .medium))

                                Text(viewModel.selectedArticle?.artInstr ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 25.0).fill(.black))
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim")))
                .ignoresSafeArea()
            }
            
            VStack {
                
                Image(viewModel.selectedArticle?.artPhoto ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 220)
                    .padding(.top, 165)
                
                Spacer()
                
                HStack {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = true
                        }
                        
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 25).stroke(.black))
                    })
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDetail = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 25).fill(.black))
                    })
                }
                .padding()
            }
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
               
                        CoreDataStack.shared.deleteArt(withArtInstr: viewModel.selectedArticle?.artInstr ?? "", completion: {
                            
                            viewModel.fetchArticles()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            viewModel.isDetail = false

                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )

    }
}

#Preview {
    ArtDetail(viewModel: ArticlesViewModel())
}
