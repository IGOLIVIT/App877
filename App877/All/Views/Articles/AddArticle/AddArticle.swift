//
//  AddArticle.swift
//  App877
//
//  Created by IGOR on 09/10/2024.
//

import SwiftUI

struct AddArticle: View {
    
    @StateObject var viewModel: ArticlesViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg3")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Add bads")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .medium))
                    .padding(.vertical)
                
                Menu(content: {
                    
                    ForEach(viewModel.images, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.imageForAdd = index
                            
                        }, label: {
                            
                            Image(index)
                        })
                    }
                    
                }, label: {
                    
                    if viewModel.imageForAdd.isEmpty {
                        
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color("prim"))
                            .frame(width: 60)
                            .frame(maxWidth: .infinity)
                            .frame(height: 180)
                            .background(RoundedRectangle(cornerRadius: 30).stroke(Color("prim")))
                        
                        
                    } else {
                        
                        Image(viewModel.imageForAdd)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
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
                            
                            Text("Protein")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.artName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.artName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)
                        .padding(.bottom)
                                                    
                            Text("In one serving (g)")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)

                            ZStack(alignment: .leading, content: {
                                
                                Text("20")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.artGramm.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.artGramm)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                            .padding(1)
                            .padding(.bottom)
                        
                        Text("Type")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], alignment: .leading, content: {
                            
                            ForEach(viewModel.types, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selType = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(viewModel.selType == index ? Color("prim") : .gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .frame(height: 60)
                                        .frame(maxWidth: .infinity)
                                        .background(RoundedRectangle(cornerRadius: 10).stroke(viewModel.selType == index ? Color("prim") : .gray))
                                        .padding(1)
                                })
                            }
                        })
                        .padding(.bottom)
                        
                        Text("Description")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.artDescr.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.artDescr)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)
                        .padding(.bottom)
                        
                        Text("Instructions")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.artInstr.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.artInstr)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)
                        .padding(.bottom, 20)
                        
                        Button(action: {
                            
                            viewModel.gr += Int(viewModel.artGramm) ?? 0
                            
                            viewModel.artPhoto = viewModel.imageForAdd
                            viewModel.artType = viewModel.selType
                            
                            viewModel.addArticle()
                            
                            viewModel.artName = ""
                            viewModel.artGramm = ""
                            viewModel.artDescr = ""
                            viewModel.artInstr = ""
                            
                            viewModel.selType = ""
                            viewModel.imageForAdd = ""
                            
                            viewModel.fetchArticles()
                            
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
                        .opacity(viewModel.artName.isEmpty || viewModel.artGramm.isEmpty || viewModel.artInstr.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.artName.isEmpty || viewModel.artGramm.isEmpty || viewModel.artInstr.isEmpty ? true : false)
                        
                        Button(action: {
                            
                            viewModel.artName = ""
                            viewModel.artGramm = ""
                            viewModel.artDescr = ""
                            viewModel.artInstr = ""
                            
                            viewModel.selType = ""
                            viewModel.imageForAdd = ""
                                                        
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
    AddArticle(viewModel: ArticlesViewModel())
}
