//
//  Home.swift
//  CarouselSlider
//
//  Created by Danh Tu on 20/09/2021.
//

import SwiftUI

struct Home: View {
    @State private var currentIndex: Int = 1
    
    var body: some View {
        VStack {
            TabView(selection: $currentIndex) {
                ForEach(1...3, id: \.self) { index in
                    VStack {
                        Image("pic\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal, 40)
                        
                        Text("Donec pede")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.top)
                        
                        Text("In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                            .padding(.top, 4)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            // Custom Tab Indicator
            CustumTabIndicator(count: 3, currentIndex: $currentIndex)
            
            // Login Button
            VStack {
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "applelogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                        
                        Text("Sign up with Apple")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .center)
                    })
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 1)
                        )
                )
                
                HStack {
                    Text("Already have an account?")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    
                    Button(action: {}, label: {
                        Text("Login")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .underline(true)
                    })
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green.ignoresSafeArea())
    }
}

struct CustumTabIndicator: View {
    var count: Int
    @Binding var currentIndex: Int
    
    var body: some View {
        HStack {
            ForEach(0..<count, id: \.self) { index in
                ZStack {
                    if (currentIndex - 1) == index {
                        Circle()
                            .fill(Color.black)
                    } else {
                        Circle()
                            .fill(Color.white)
                            .overlay(
                                Circle()
                                    .stroke(Color.black, lineWidth: 1.5)
                            )
                    }
                }
                .frame(width: 10, height: 10)
            }
        }
        
    }
}
