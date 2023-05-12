//
//  studyView.swift
//  studyTimerCat
//
//  Created by 90309356 on 3/2/23.
//
import SwiftUI

struct studyView: View{
    @EnvironmentObject var min : testing
    @State var showingAlert = false
    @State var initialTime = 0  //Used to keep track of the current time
    @State private var buttonText = "Pause"
    @State var endDate = Date() //Used to keep track of the current time
    @State var minutes: Float = 30.0{ //user selected minutes (slider)
        didSet{
            min.time = "\(Int(min.minutes)):00" //when user picks time, immediatly update the time (slider)
        }//closes didset
    }//closes float
    @State var shouldHide = false
  
    let skyBlue = Color(red: 0.808, green: 0.847, blue: 0.78)
    
    
    
    func updateCountDown(){ //actually updates published value and format everything
        guard min.isActive else{return} // make sure isActive is true
        
        let now = Date() // current date
        let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970 // remaining time between now and the end time
        
        if diff <= 0{ //means count down is over
            min.isActive = false
            min.time = "0:00"
            showingAlert = true
            return
        } // diff
        
        let date = Date(timeIntervalSince1970: diff)
        let calendar = Calendar.current //grab components from calendar
        let minute = calendar.component(.minute, from:date) // grab minutes from the components
        let second = calendar.component(.second, from:date) // grab seconds.  from the components
        //^^ needed to create string
        min.minutes = Float(minutes) //keep track of remaining minutes fromt the slider
        min.time = String(format:"%d:%02d", minute, second) // assign that to the string and formate.
        
        
    }//func updateCountDown
    
    
    public let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
       // let title = Text("pause")
        ZStack {
            skyBlue
                .ignoresSafeArea()
            VStack{
                
                
                Text("\(min.time)")
                    .font(.system(size: 70, weight: .medium, design: .rounded))
                    .padding()
                    .alert("timer done!", isPresented: $showingAlert){
                    }
                    .onAppear{
                        start(minutes: min.minutes)
                    } .disabled(min.isActive)
                
                Button(buttonText, action: {
                    if buttonText == "pause" {
                        buttonText = "unpause"
                        min.isActive = false
                    } else{
                        buttonText = "pause"
                        min.isActive = true
                    }
                    
                   //buttonText = "upause"
                   // min.isActive = false
                    
                    
                })
                
                
               // if buttonText == "unpause"{
                   // Button(buttonText, action: {
                        
                       // self.shouldHide = true
                        //buttonText = "pause"
                        //min.isActive = true
                        
                   // }).opacity(shouldHide ? 0 : 1)
               // }
                 
                Image(min.imageString)
            }
            .environmentObject(testing())
            .onReceive(timer) {_ in
                updateCountDown()
            }
        }//zstack
    } // var body: some View
    
    func start(minutes: Float){ //Start timer with the given minutes (has to be float bc slider requires float)
        initialTime = Int(minutes) // initial time set to the int of the minutes the user selects
        endDate = Date() // date of the time when the user starts the timer (time gets
        min.isActive = true // timer starts so is currentenly on
        endDate = Calendar.current.date(byAdding: .minute /* can change <<< to hour our minutes*/, value: Int(minutes), to: endDate)! // adding the user inputed minutes to the end date
    }//func start
    
    


   
  
} // struct studyView: View





    struct studyView_Previews: PreviewProvider {
        static var previews: some View {
            studyView()
                .environmentObject(testing())
        }
    }

