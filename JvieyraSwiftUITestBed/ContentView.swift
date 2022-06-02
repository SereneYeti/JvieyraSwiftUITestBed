//
//  ContentView.swift
//  JvieyraSwiftUITestBed
//
//  Created by IACD-011 on 2022/06/01.
//

import SwiftUI

public enum tabs : Hashable{
    case Home
    case timer
    case add
}

//NavigationLink("Go to Other Page", destination: //ContenvtViewB()).tabItem

struct ContentView: View {
    
    @State var selectedItem:tabs = .Home
    
    var body: some View {
        NavigationView{
            TabView(selection: $selectedItem) {
                HomeView().tabItem
                {
                    Image(systemName: "house.fill")
                    Text("Home").bold()
                }.tag(tabs.Home)
                AddWorkoutView().tabItem{
                    Image(systemName: "plus.circle.fill")
                    Text("Add").bold()
                }
                TimerView().tabItem
                {
                    Image(systemName: "alarm")
                    Text("Timer").bold()
                }.tag(tabs.timer)
            }.onAppear(){
                UITabBar.appearance().backgroundColor = .lightGray
            }.accentColor(.blue)
        }
    }
}

struct HomeView: View {
    var body: some View{
        Text("This is the Home view.")
    }
}
struct AddWorkoutView: View {
    var body: some View{
        Text("This is the add workout view.")
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        AddWorkoutView()
        TimerView()
    }
}

