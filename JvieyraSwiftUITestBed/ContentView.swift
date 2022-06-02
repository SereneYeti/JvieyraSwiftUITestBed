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

struct TimerView: View {
    
@State var hours: Int = 0
@State var minutes: Int = 0
@State var seconds: Int = 0
@State var timerIsPaused: Bool = true
  
@State var timer: Timer? = nil

var body: some View {
    VStack {
        Text("\(hours):\(minutes):\(seconds)").font(.system(size: 50)).bold() //Note the \() allows code variables to be sorted and organized as normal strings would be.
            .frame(
                  minWidth: 0,
                  maxWidth: .infinity,
                  minHeight: 0,
                  maxHeight: .infinity,
                  alignment: .center
            ).padding().id("TimerLabel")
        HStack {
            Button(action: StartTimer) {
                Text("Start").font(.system(size: 32, weight: .bold)).scaledToFill().frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .center)
           }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
           ).background(Color.green).colorMultiply(Color.green).buttonBorderShape(ButtonBorderShape.roundedRectangle).foregroundColor(Color.black)
            Button(action: StopTimer) {
                Text("Stop").font(.system(size: 32, weight: .bold)).scaledToFill().frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .center)
            }.frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
              ).background(Color.red).colorMultiply(Color.red).buttonBorderShape(ButtonBorderShape.roundedRectangle)
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
          )//.scaledToFill()
    }.frame(
        minWidth: 0,
        maxWidth: .infinity,
        minHeight: 0,
        maxHeight: .infinity,
        alignment: .topLeading
      )//.scaleEffect(2.5)
    
}

func StartTimer() -> Void{
    timerIsPaused = false
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
          if self.seconds == 59 {
            self.seconds = 0
              PlaySound()
            if self.minutes == 59 {
              self.minutes = 0
              self.hours = self.hours + 1
            } else {
              self.minutes = self.minutes + 1
            }
          } else {
            self.seconds = self.seconds + 1
              //if(seconds%15 == 0){PlaySound()}
          }
        }
}
    //To Fix

func PlaySound()->Void{
    // create a sound ID, in this case its the tweet sound.
   

    // to play sound
    
    
}

func StopTimer() -> Void {
        timerIsPaused = true
        timer?.invalidate()
        timer = nil
        hours = 0;
        minutes = 0;
        seconds = 0;
}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        AddWorkoutView()
        TimerView()
    }
}

