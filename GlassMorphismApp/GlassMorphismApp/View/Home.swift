//
//  Home.swift
//  GlassMorphismApp
//
//  Created by Adrian Suryo Abiyoga on 05/06/24.
//

import SwiftUI

struct Home: View {
    // View Properties
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        VStack{
            //Login View
            VStack(spacing:12){
                
                Text("Welcome!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/ .bold())
                
                VStack(alignment: .leading,spacing: 8, content: {
                    Text("Username")
                        .font(.callout .bold())
                    
                    CustomTF(hint: "Adrian", value: $username)
                    
                    Text("Password")
                        .font(.callout .bold())
                        .padding(.top, 15)
                    
                    CustomTF(hint: "*****", value: $password, isPassword: true)
                    
                    Button(action: {}, label: {
                        Text("Login")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.BG)
                            .padding(.vertical, 12)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .background(.white)
                            .clipShape(.rect(cornerRadius: 8, style: .continuous))
                            
                        
                    })
                    .padding(.top, 30)
                })
                
                //other login options
                HStack(spacing: 12){
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Label("Email", systemImage: "envelope.fill")
                            .fontWeight(.semibold)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .padding(.vertical, 10)
                        // adding transparent blur
                            .background{
                                TransparentBlurView(removeAllFilters: false)
                                    .background(.white.opacity(0.2))
                            }
                            .clipShape(.rect(cornerRadius: 8, style: .continuous))
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Label("Apple", systemImage: "applelogo")
                            .fontWeight(.semibold)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .padding(.vertical, 10)
                        // adding transparent blur
                            .background{
                                TransparentBlurView(removeAllFilters: false)
                                    .background(.white.opacity(0.2))
                            }
                            .clipShape(.rect(cornerRadius: 8, style: .continuous))
                    })
                    
                }
                .foregroundStyle(.white)
                .padding(.top, 15)
            }
            .padding(.horizontal, 30)
            .padding(.top, 35)
            .padding(.bottom, 25)
            .background{
                TransparentBlurView(removeAllFilters: true)
                    .blur(radius: 9, opaque: true)
                    .background(.white.opacity(0.05))
            }
            .clipShape(.rect(cornerRadius: 10, style: .continuous))
            // light white border
            .background{
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(.white.opacity(0.3), lineWidth: 1.5)
            }
            //adding shadow
            .shadow(color: .black.opacity(0.2), radius: 10)
            .padding(.horizontal, 40)
            .background{
                ZStack{
                    Circle()
                        .fill(
                            LinearGradient(colors: [Color("Gradient1"), Color("Gradient2")], startPoint: .top, endPoint: .bottom)
                        )
                    
                        .frame(width: 140, height: 140)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .offset(x:-25, y:-55)
                    
                    Circle()
                        .fill(
                            LinearGradient(colors: [Color("Gradient3"), Color("Gradient4")], startPoint: .top, endPoint: .bottom)
                        )
                    
                        .frame(width: 140, height: 140)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        .offset(x:25, y:55)
                    
                }
            }
        }
        .foregroundStyle(.white)
        .frame(maxWidth: 390)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background{
            Rectangle()
                .fill(.BG)
                .ignoresSafeArea()
        }
        
       
    }
    //Custom Text Field
    @ViewBuilder
    func CustomTF(hint: String, value: Binding<String>, isPassword: Bool = false) -> some View{
        Group{
            if isPassword{
                SecureField(hint, text: value)
            }else {
                TextField(hint, text: value)
            }
        }
        .environment(\.colorScheme, .dark)
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .background(.white.opacity(0.12))
        .clipShape(.rect(cornerRadius: 8, style: .continuous))
    }
}

#Preview {
    ContentView()
}
