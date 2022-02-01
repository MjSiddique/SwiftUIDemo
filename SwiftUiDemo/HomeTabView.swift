//
//  HomeTabView.swift
//  SwiftUiDemo
//
//  Created by Mohammed Jeeshan on 10/11/21.
//

import SwiftUI

struct HomeTabView: View {
    @State var defaultView:Int = 1
    var body: some View {
        TabView(selection: $defaultView,
                content:  {
                    SampleView(viewName: "Play")
                        .tabItem {
                            Text("Home")
                            Image(systemName: "play")
                        }.tag(0)
                    ContentView()
                        .tabItem {
                            Text("Home")
                            Image(systemName: "house")
                        }.tag(1)
                    SampleView(viewName: "Chat")
                        .tabItem {
                            Text("Home")
                            Image(systemName: "message")
                        }.tag(2)
                })
            .accentColor(Color("mj"))
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
