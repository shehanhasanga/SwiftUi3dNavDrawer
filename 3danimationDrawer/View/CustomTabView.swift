//
//  CustomTabView.swift
//  3danimationDrawer
//
//  Created by shehan karunarathna on 2022-03-07.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var currentTab:String
    @Binding var showMenu:Bool
    
   
    var body: some View {
        VStack{
            HStack{
                Button{
                    withAnimation(.spring()) {
                        showMenu = true
                    }
                }label: {
                    Image(systemName: "line.3.horizontal.decrease")
                        .font(.title.bold())
                        .foregroundColor(.white)
                }
                .opacity(!showMenu ? 1 : 0)
                
                Spacer()
                
                Button{
                    
                }label: {
                    Image(systemName: "person")
                        .font(.title.bold())
                        .foregroundColor(.white)
                }
            }
            .padding([.horizontal, .top])
            .overlay(
                Button{
                    withAnimation(.spring()) {
                        showMenu = false
                    }
                }label: {
                    Image(systemName: "xmark")
                        .font(.title.bold())
                        .foregroundColor(.white)
                }
                    .opacity(showMenu ? 1 : 0), alignment: .topLeading
            )
            .padding(.bottom, 8)
            .padding(.top, getSafeArea().top)
            
            
            TabView(selection: $currentTab) {
                Text("Home")
                    .tag("Home")
                Text("Discover")
                    .tag("Discover")
                Text("Device")
                    .tag("Device")
                Text("Profile")
                    .tag("Profile")
                Text("Settings")
                    .tag("Settings")
                Text("About")
                    .tag("About")
                Text("Help")
                    .tag("Help")
                
            }
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
