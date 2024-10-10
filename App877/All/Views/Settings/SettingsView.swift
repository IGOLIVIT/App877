//
//  SettingsView.swift
//  App877
//
//  Created by IGOR on 01/10/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {

                        viewModel.isSettings = false
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
                    
                    VStack(spacing: 9) {
                        
                        HStack {
                            
                            Button(action: {
                                
                                SKStoreReviewController.requestReview()
                                
                            }, label: {
                                
                                VStack(spacing: 23) {
                                    
                                    HStack {
                                        
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .regular))
                                            .padding(4)
                                            .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                                            .frame(maxWidth: .infinity)
                                        
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .regular))
                                            .padding(4)
                                            .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                                            .frame(maxWidth: .infinity)
                                        
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .regular))
                                            .padding(4)
                                            .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                                            .frame(maxWidth: .infinity)
                                        
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .regular))
                                            .padding(4)
                                            .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                                            .frame(maxWidth: .infinity)
                                        
                                    }
                                    
                                    Text("Rate Us")
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .medium))
                                    
                                    Text("Rate")
                                        .foregroundColor(.black)
                                        .font(.system(size: 14, weight: .regular))
                                        .frame(width: 120, height: 50)
                                        .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim")))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 170)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                            })
                            
                            Button(action: {
                                
                                guard let url = URL(string: "https://www.termsfeed.com/live/0800ad93-973a-4f1a-b872-79197e2f9f57") else { return }
                                
                                UIApplication.shared.open(url)
                                
                            }, label: {
                                
                                VStack(spacing: 23) {

                                    Text("Usage Policy")
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .medium))
                                    
                                    Text("Read")
                                        .foregroundColor(.black)
                                        .font(.system(size: 14, weight: .regular))
                                        .frame(width: 120, height: 50)
                                        .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim")))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 170)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                            })

                        }
                    }
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
