//
//  ContentView.swift
//  PersonalApp
//
//  Created by Clement Ng on 22/11/2021.
//

import SwiftUI

enum Page {
    case Home
    case AboutMe
}

struct ContentView: View {
    @State var selectedTabIndex = Page.Home;
    
    var body: some View {
        NavigationView {
            VStack {
                
                switchTab()
                Spacer()
                VStack {
                    Picker("Picker", selection: $selectedTabIndex, content: {
                        Text("Home").tag(Page.Home)
                        Text("About Me").tag(Page.AboutMe)
                    }).pickerStyle(SegmentedPickerStyle()).padding()
                }
                
            }
        }
    }
    
    func switchTab() -> AnyView {
        switch selectedTabIndex {
        case .Home:
            return AnyView( ScrollView {
                Text("Clement Ng").bold().font(.system(size: 32))
                
                Image("Avator").resizable().frame(width: 200, height: 200)
            })
        case .AboutMe:
            return AnyView(AboutMeView())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
