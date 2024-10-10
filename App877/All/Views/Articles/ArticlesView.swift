//
//  ArticlesView.swift
//  App877
//
//  Created by IGOR on 01/10/2024.
//

import SwiftUI

struct ArticlesView: View {
    
    @StateObject var viewModel: ArticlesViewModel
    @StateObject var mainModel: HomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        mainModel.isArticles = false
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

                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        ForEach(viewModel.types, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.curTypeForShow = index
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                                    .padding(8)
                                    .padding(.horizontal, 8)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(viewModel.curTypeForShow == index ? Color("prim") : .gray.opacity(0.2)))
                            })
                        }
                    }
                }
                .padding(.bottom, 25)
                
                if viewModel.articles.isEmpty {
                    
                    VStack {
                        
                        Text("You haven't any bads yet Add them to keep statistics")
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .bold))
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 26)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
                        })
                        
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    if viewModel.curTypeForShow == "All" {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.articles, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.selectedArticle = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isDetail = true
                                        }
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            VStack(alignment: .leading, spacing: 8) {
                                                
                                                Text(index.artName ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 16, weight: .medium))
                                                
                                                Text(index.artDescr ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 14, weight: .regular))
                                                
                                                Spacer()
                                                
                                                Text(index.artGramm ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 16, weight: .regular))
                                            }
                                            .padding()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            Image(index.artPhoto ?? "")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxHeight: .infinity)
                                        }
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 180)
                                    })
                                }
                            }
                        }
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.articles.filter{($0.artType ?? "") == viewModel.curTypeForShow}, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.selectedArticle = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isDetail = true
                                        }
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            VStack(alignment: .leading, spacing: 8) {
                                                
                                                Text(index.artName ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 16, weight: .medium))
                                                
                                                Text(index.artDescr ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 14, weight: .regular))
                                                
                                                Spacer()
                                                
                                                Text(index.artGramm ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 16, weight: .regular))
                                            }
                                            .padding()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            Image(index.artPhoto ?? "")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxHeight: .infinity)
                                        }
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 180)
                                    })
                                }
                            }
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
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 100)
            }
        }
        .onAppear {
            
            viewModel.fetchArticles()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddArticle(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            ArtDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    ArticlesView(viewModel: ArticlesViewModel(), mainModel: HomeViewModel())
}
