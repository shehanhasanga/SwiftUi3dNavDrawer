//
//  SideMenu.swift
//  3danimationDrawer
//
//  Created by shehan karunarathna on 2022-03-07.
//

import SwiftUI

struct SideMenu: View {
    @Binding var currentTab:String
    @Namespace var animation
    var body: some View {
        VStack{
            HStack(spacing:15){
                Image(systemName: "person")
                    .font(.system(size: 45))
                Text("shehan")
                    .font(.title.bold())
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth:.infinity, alignment: .leading)
            ScrollView(getbounds().height < 750 ? .vertical : .init(), showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    CustomButton(icon: "theatermasks.fill", title: "Home")
                    CustomButton(icon: "safari.fill", title: "Discover")
                    CustomButton(icon: "applewatch.fill", title: "Device")
                    CustomButton(icon: "person.fill", title: "Profile")
                    CustomButton(icon: "gearshape.fill", title: "Settings")
                    CustomButton(icon: "info.circle.fill", title: "About")
                    CustomButton(icon: "questionmark.circle.fill", title: "Help")
                    
                    Spacer()
                    CustomButton(icon: "rectangle.portrait.and.arrow.fill", title: "LogOut")
                }
                .padding()
                .padding(.top, 45)
            }
          
           
            .frame(width: getbounds().width / 2 , alignment: .leading)
            .frame(maxWidth:.infinity, alignment: .leading)
        }
        .padding(.leading, 10)
        .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
        .background(
            Color.blue
        )
    }
    @ViewBuilder
    func CustomButton(icon:String, title:String) -> some View {
        Button{
            if title == "LogOut" {
                
            } else {
                withAnimation {
                    currentTab = title
                }
            }
           
        }label: {
            HStack(spacing:12){
                Image(systemName: icon)
                    .font(.title)
                    .frame(width: currentTab == title ?  45 : nil, height: 45)
                    .foregroundColor(currentTab == title ? Color.purple : (title == "LogOut" ? Color.orange : .white))
                    .background(
                        ZStack{
                            if currentTab == title {
                                Color.white.clipShape(Circle())
                                    .matchedGeometryEffect(id: "TABCIRCLE", in: animation)
                            }
                        }
                      
                    )
                Text(title)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor( title == "LogOut" ? .orange : .white)
                
                
            }
            .padding(.trailing, 18)
            .background(
                ZStack{
                    if currentTab == title {
                        Color.purple
                            .clipShape(Capsule())
                            .matchedGeometryEffect(id: "TABCAPSULE", in: animation)
                    }
                }
                
            )
        }
        .offset(x: currentTab == title ? 15 : 0)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}

extension View {
    func getbounds() -> CGRect {
        return UIScreen.main.bounds
    }
}
