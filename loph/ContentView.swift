//
//  ContentView.swift
//  studyCat
//
//  Created by 90309356 on 2/3/23.
import SwiftUI
@MainActor class testing : ObservableObject{
    @Published var showingAlert = false
    @Published var isActive = false
    @Published var time: String = "30:00"
    @Published var minutes: Float = 30.0{
        didSet{
            time = "\(Int(minutes)):00"
        }
    }
}

struct ContentView: View {
   // @Environment(\.scenePhase) var scenePhase
    @StateObject var min = testing()
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Text("\(min.time)")
                    .font(.system(size: 70, weight: .medium, design: .rounded))
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius:20).stroke(Color.gray, lineWidth:4))
                
                
                Slider(value: $min.minutes, in: 1...60, step:1)
                    .disabled(min.isActive)
                    .frame(width: 250)
                    .animation(.easeInOut, value: min.minutes)
                
                
                NavigationLink{
                    studyView()
                } label: {
                    Text("start")
                }//label
                Spacer()
                HStack {
                    Spacer()
                    Image("white bird")
                }
                
                
            }
            
        }.environmentObject(min)
           
        //navigationView
    }//body
}//struct view
    

        
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
                       

