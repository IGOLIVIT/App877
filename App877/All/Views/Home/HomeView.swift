//
//  HomeView.swift
//  App877
//
//  Created by IGOR on 01/10/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @StateObject var mainModel: ArticlesViewModel
    
    var total: Double {
        viewModel.protein + viewModel.amino + viewModel.vitamins + viewModel.creatine + viewModel.chromium
    }
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isProfile = true
                        }
                        
                    }, label: {
                        
                        if viewModel.photo.isEmpty {
                            
                            Image(systemName: "photo.circle")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 38, weight: .regular))
                            
                        } else {
                            
                            Image(viewModel.photo)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                        }
                        
                        VStack {
                            
                            Spacer()
                            
                            Text(viewModel.name)
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 12, weight: .regular))
                        }
                        
                    })
                    
                    Spacer()
                    
                    Menu(content: {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isArticles = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image("Dietary")
                                
                                Text("Dietary")
                            }
                                                        
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isBads = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image("Strategies")
                                
                                Text("Strategies")
                            }
                                                        
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isSettings = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image("Settings")
                                
                                Text("Settings")
                            }
                                                        
                        })
                        
                        
                    }, label: {
                      
                        VStack {
                            
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color("prim"))
                                .frame(width: 40)
                                .frame(height: 3)
                            
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color("prim"))
                                .frame(width: 40)
                                .frame(height: 3)
                            
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color("prim"))
                                .frame(width: 40)
                                .frame(height: 3)
                        }
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .padding()
                
                VStack {
                    
                    if mainModel.articles.isEmpty {
                        
                        ZStack {
                            
                            Circle()
                                .stroke(Color.gray, lineWidth: 20)
                                .rotationEffect(.degrees(-90))
                         
                            VStack {
                                
                                Text("\(viewModel.gr) g")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 26, weight: .semibold))
                                
                                Text("Eaten")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .medium))
                                
                            }
                            
                        }
                        .padding()
                        
                    } else {
                        
                        ZStack {
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(viewModel.protein / total))
                                .stroke(Color("pp"), lineWidth: 40)
                                .rotationEffect(.degrees(-90))
                            
                            Circle()
                                .trim(from: CGFloat(viewModel.protein / total), to: CGFloat((viewModel.protein + viewModel.amino) / total))
                                .stroke(Color("pb"), lineWidth: 40)
                                .rotationEffect(.degrees(-90))
                            
                            Circle()
                                .trim(from: CGFloat(viewModel.protein + viewModel.amino / total), to: CGFloat((viewModel.protein + viewModel.amino + viewModel.vitamins) / total))
                                .stroke(Color("pbb"), lineWidth: 40)
                                .rotationEffect(.degrees(-90))
                            
                            Circle()
                                .trim(from: CGFloat(viewModel.protein + viewModel.amino + viewModel.vitamins / total), to: CGFloat((viewModel.protein + viewModel.amino + viewModel.vitamins + viewModel.creatine) / total))
                                .stroke(Color("prim"), lineWidth: 40)
                                .rotationEffect(.degrees(-90))
                            
                            Circle()
                                .trim(from: CGFloat((viewModel.protein + viewModel.amino + viewModel.vitamins + viewModel.creatine) / total), to: 1)
                                .stroke(Color("prim2"), lineWidth: 40)
                                .rotationEffect(.degrees(-90))
                            
                            VStack {
                                
                                Text("\(viewModel.gr) g")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 26, weight: .semibold))

                                Text("Eaten")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .medium))
                                
                            }
                        }
                        .frame(width: 200, height: 200)
                        .padding()
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 280)
                .background(Image("badfull").resizable())
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 8) {
                        
                        ForEach(mainModel.articles, id: \.self) { index in
                        
                            HStack {
                                
                                Text(index.artName ?? "")
                                    .foregroundColor(Color("pp"))
                                    .font(.system(size: 30, weight: .semibold))
                                
                                Spacer()
                                
                                Text("\(index.artGramm ?? "")g")
                                    .foregroundColor(Color("pp"))
                                    .font(.system(size: 25, weight: .regular))
                            }
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.isProfile, content: {
            
            ProfileView(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isArticles, content: {
            
            ArticlesView(viewModel: ArticlesViewModel(), mainModel: HomeViewModel())
        })
        .sheet(isPresented: $viewModel.isBads, content: {
            
            BadsView(viewModel: BadsViewModel(), mainModel: HomeViewModel())
        })
        .sheet(isPresented: $viewModel.isSettings, content: {
            
            SettingsView(viewModel: HomeViewModel())
        })
        .onAppear {
            
            mainModel.fetchArticles()
        }
    }
}

#Preview {
    HomeView(mainModel: ArticlesViewModel())
}
