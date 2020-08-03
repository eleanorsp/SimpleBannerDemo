//
//  ContentView.swift
//  SimpleBannerDemo
//
//  Created by Eleanor Spenceley on 01/08/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            
            // We create the parent view where the banner exists and embed your view inside it.
            // Then we create the appropriate Model we wish to use with it. You can customise your own
            // Model to do different actions. Want the banner customised? Then there's a solution for that too!
            //
            AppBannerParentView<AppBannerDemoView, AppBannerModel>() {
                AppBannerDemoView()
            }
            .environmentObject(AppBannerModel(bannerColors: buildAppBannerColors()))
            .tabItem {
                Image(systemName: "square.and.pencil")
                Text("App Demo")
            }
            
            AppBannerParentView<BasicBannerDemoView, BasicBannerModel>() {
                BasicBannerDemoView()
            }
            .environmentObject(BasicBannerModel())
            .tabItem {
                Image(systemName: "square.and.pencil")
                Text("Basic Demo")
            }
            
        }
    }
    
    func buildAppBannerColors() -> [SystemWarningStatus: Color] {
        
        var bannerColors = [SystemWarningStatus: Color]()
        bannerColors[.information] = Color.customInfoColor
        bannerColors[.warning] = Color.customWarningColor
        bannerColors[.error] = Color.customErrorColor
        
        return bannerColors
    }
}

extension Color {
    public static let customInfoColor: Color = Color(red: 169/255, green: 255/255, blue: 158/255, opacity: 0.8)
    public static let customWarningColor: Color = Color(red: 255/255, green: 198/255, blue: 155/255, opacity: 0.8)
    public static let customErrorColor: Color = Color(red: 219/255, green: 127/255, blue: 135/255, opacity: 0.8)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
