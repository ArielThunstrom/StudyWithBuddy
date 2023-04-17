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
let skyBlue = Color(red: 0.808, green: 0.847, blue: 0.78)


struct ContentView: View {
   // @Environment(\.scenePhase) var scenePhase
    @StateObject var min = testing()
    //@ObservedObject var picture = birdImage()
    @ObservedObject var picture = birdImage()
    
    @State var picString = "white bird"
       
    
    
    
    var body: some View {
        
        //var test = picture.start
        //picString = test.image
        
        NavigationView{
            ZStack {
                skyBlue
                    .ignoresSafeArea()
                VStack{
                    //Spacer()
                    NavigationLink {
                        clothingView(pictureString: Binding.constant("white bird"))
                    } label: {
                        Text("closet")
                    }
                    Spacer()
                    Text("\(min.time)")
                        .font(.system(size: 70, weight: .medium, design: .rounded))
                        .padding()
                       // .overlay(RoundedRectangle(cornerRadius:20).stroke(Color.gray, lineWidth:4))
                    
                    
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
                        //Image("white bird")
                        Image(picString)
                    }
                    
                    
                }
                
            }
            //.sheet(pictureString: $picString) {
              //  clothingView(pictureString: $picString)
            //}
        } .environmentObject(min)
            
        //navigationView
    }//body
}//struct view
    

        
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            //ContentView(picString: "white bird")
            ContentView()
        }
    }
                       

