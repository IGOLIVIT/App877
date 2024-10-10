//
//  ProfileView.swift
//  App877
//
//  Created by IGOR on 01/10/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 14) {
                        
                        Text("Profile")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Menu(content: {
                            
                            ForEach(viewModel.photos, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.enterPhoto = index
                                    
                                }, label: {
                                    
                                    Text("Men")
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.enterPhoto.isEmpty {
                                
                                Image(systemName: "person.circle")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30, weight: .regular))
                                    .frame(width: 100, height: 100)
                                    .background(Circle().stroke(.white, lineWidth: 1))
                                    .padding(1)
                                    .overlay(
                                    
                                        VStack {
                                            
                                            Spacer()
                                            
                                            HStack {
                                                
                                                Spacer()
                                                
                                                Image(systemName: "plus")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 12, weight: .medium))
                                                    .padding(4)
                                                    .background(Circle().fill(Color("prim")))
                                            }
                                        }
                                    )
                                
                            } else  {
                                
                                Image(viewModel.enterPhoto)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 101)
                            }
                            
                        })
                        
                        Text("Name")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .medium))
                                    .opacity(viewModel.enterName.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.enterName)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))
                            .padding(1)
                            .padding(.bottom)
                        
                        Button(action: {
                            
                            viewModel.name = viewModel.enterName
                            viewModel.photo = viewModel.enterPhoto
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isProfile = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
                        })
                    }
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    ProfileView(viewModel: HomeViewModel())
}
