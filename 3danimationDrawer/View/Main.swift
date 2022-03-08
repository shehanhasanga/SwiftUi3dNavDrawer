//
//  Main.swift
//  3danimationDrawer
//
//  Created by shehan karunarathna on 2022-03-07.
//

import SwiftUI

struct Main: View {
    @State var currentTab:String = "Home"
    @State var showMenu:Bool = false
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        ZStack{
            SideMenu(currentTab:$currentTab)
              
            CustomTabView(currentTab: $currentTab, showMenu : $showMenu)
                .cornerRadius(showMenu ? 25 : 0)
                .rotation3DEffect(.init(degrees: showMenu ? -15 : 0), axis: (x: 0, y: 1, z: 0), anchor: .trailing)
                .offset(x: showMenu ? getbounds().width / 2 : 0)
                .ignoresSafeArea()
        }
        .preferredColorScheme(.dark)
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}

extension View {
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {return .zero}
        guard let safearea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safearea
    }
}
