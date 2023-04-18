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
    //@Published var testString : String = "white bird"
    @Published var imageString: String = "white bird"
    
}



let skyBlue = Color(red: 0.808, green: 0.847, blue: 0.78)



struct ContentView: View {
   // @Environment(\.scenePhase) var scenePhase
    @StateObject var min = testing()
    //@ObservedObject var picture = birdImage()
    //@ObservedObject var picture = birdImage()
    //@EnvironmentObject var birdy : pictureString
    
    
    
    //let starting : String = birdy.imageString
    //@State var picString = "white bird"
       
    
    
    
    var body: some View {
        
        //var test = picture.start
        //picString = test.image
        //var starting : String = birdy.imageString
        //var starting : String = birdy.imageString
        
        
        NavigationView{
            ZStack {
                skyBlue
                    .ignoresSafeArea()
                VStack{
                    //Spacer()
                    
                    NavigationLink {
                        clothingView()
                    } label: {
                        Text("Change Your Study Buddy")
                            .font(.system(.title2, design: .monospaced))
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
                        Text("Start Study Session")
                            .font(.system(.title2, design: .monospaced))
                    }//label
                    Spacer()
                    HStack {
                        Spacer()
                        //Image("white bird")
                        Image(min.imageString)
                    }
                    
                    
                }
                
            }
            //.sheet(pictureString: $picString) {
              //  clothingView(pictureString: $picString)
            //}
        } .environmentObject(min)
          //.environmentObject(pictureString())
            
        //navigationView
    }//body
}//struct view
    

        
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            //ContentView(picString: "white bird")
            ContentView()
                
        }
    }
                       

