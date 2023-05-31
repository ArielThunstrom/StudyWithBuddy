//
//  studyView.swift
//  studyTimerCat
//
//  Created by 90309356 on 3/2/23.
//
import SwiftUI

struct studyView: View{
    @EnvironmentObject var min : testing
    @State var shouldHide = false
    @State private var isPlaying = true
    @State var showingAlert = false
    @State var initialTime = 0  //Used to keep track of the current time
    @State private var buttonText = "pause"
    @State var endDate = Date() //Used to keep track of the current time
    @State var minutes: Float = 30.0{ //user selected minutes (slider)
        didSet{
            min.time = "\(Int(min.minutes)):00" //when user picks time, immediatly update the time (slider)
        }//closes didset
    }//closes float
    public let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let green = Color(red: 0.808, green: 0.847, blue: 0.78)

    @Environment(\.dismiss) private var dismiss
 
    
    var body: some View {
        ZStack {
            green
                .ignoresSafeArea()
            VStack{
                
                
                Text("\(min.time)")
                    .font(.system(size: 70, weight: .medium, design: .rounded))
                    .padding()
                    .alert("Timer Done!", isPresented: $showingAlert){
                        Button("End", role: .destructive, action: goBack)
                        
                        
                       //dismiss()
                    }
                    .onAppear{
                        start(minutes: min.minutes)
                    } .disabled(min.isActive)
                
                Button("End Timer", action: {
                    reset()
                    dismiss()
                    
                }).tint(.red)
                    .font(.system(.title3, design: .monospaced))
                    .padding()
                    .frame(width: 200)
                    .background(.thinMaterial)
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 4))
                
                
                
                ZStack{
                    Image("branch 1")

                   Image(min.imageString)
                }
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
    
    func reset() {
        self.minutes = Float(initialTime)
        self.min.isActive = false
        self.min.time = "\(Int(minutes)):00"
    }
    
    
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

    func goBack() {
        dismiss()
    } // goBack
    

  
} // struct studyView: View





    struct studyView_Previews: PreviewProvider {
        static var previews: some View {
            studyView()
                .environmentObject(testing())
        }
    }

