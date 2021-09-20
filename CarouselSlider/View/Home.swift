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
            let isSmallDevice = UIScreen.main.bounds.height < 750
            // Custom Page Tab Bar
            // or Carousel Slide
            TabView(selection: $currentIndex) {
                ForEach(1...3, id: \.self) { index in
                    
                    // For custom scroll effect
                    GeometryReader { proxy -> AnyView in
                        let minX = proxy.frame(in: .global).minX
                        let width = UIScreen.main.bounds.width
                        let progress = -minX / (width * 2)
                        var scale = progress > 0 ? 1 - progress : 1 + progress
                        
                        scale = scale < 0.7 ? 0.7 : scale
                        
                        return AnyView(
                            VStack {
                                Spacer()
                                
                                Image("pic\(index)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.horizontal, 40)
                                    .frame(maxHeight: .infinity, alignment: .center)
                                
                                Spacer()
                                
                                Text("Aenean Vulputate")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                                    .padding(.top, 20)
                                
                                Text("Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi.")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                    .padding(.top, 10)
                            }
                            .padding(.top, isSmallDevice ? 10 : 0)
                            .frame(maxHeight: .infinity, alignment: .center)
                            .scaleEffect(scale)
                        )
                    }
                    .tag(index)
                }
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .padding(.vertical)
            
            // Custom Tab Indicator
            CustomTabIndicator(count: 3, current: $currentIndex)
                .padding(.vertical, isSmallDevice ? 10 : 15)
            
            // Login button
            VStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack {
                        Image(systemName: "applelogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(.white)
                        
                        Text("Sign up with Apple")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
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
                })
                
                HStack {
                    Text("Already have an account?")
                        .foregroundColor(.white)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Login")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .underline(true, color: Color.white)
                    })
                }
                .padding(.top)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green.ignoresSafeArea())
    }
}

struct CustomTabIndicator: View {
    var count: Int
    @Binding var current: Int
    
    var body: some View {
        HStack {
            ForEach(0..<count, id: \.self) { index in
                ZStack {
                    // Since our image index starts from 1
                    if (current - 1) == index {
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
