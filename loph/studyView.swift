//
//  studyView.swift
//  studyTimerCat
//
//  Created by 90309356 on 3/2/23.
//

import SwiftUI

struct studyView: View {

  //  let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    @StateObject private var vm = ViewModel()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private let width: Double = 250
    @State var progressValue: Float = 0.0
 //   @State var timer= Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//timer needs to be a float? for progress bar to work
    let skyBlue = Color(red: 0.95, green: 0.85, blue: 1.00)
    

    
    

    var body: some View {
            ZStack{
                skyBlue
                    .ignoresSafeArea()
                VStack {
                    Menu  {
                        Button ("End Timer") {
                            
                        }
                        Menu ("Add Break"){
                            Button ("5 Minute Breeak"){
                            }
                            Button ("7 Minute Break") {
                            }
                            Button ("10 Minute Break"){
                            }
                        }
                        
                        Button("Close", role: .destructive){
                        }
                        
                        
                    } label: {
                        Label("Pause", systemImage: "pause.fill")
                    }
                    VStack{
                        
                        Text("\(vm.time)")
                            .font(.system(size: 70, weight: .medium, design: .rounded))
                            .padding()
                        
                        Button("start"){
                            vm.start(minutes: vm.minutes)
                        }
                        .disabled(vm.isActive)
                        }
                    .onReceive(timer) { _ in
                        vm.updateCountDown()
                    }
                    //^^This is how the timer sets.
                    
                    
                            //don't need a reset button
                            //   Button("reset", action:vm.reset)
                            //    .tint(.red)
                            // .frame(width: width)
                        
                    Spacer()
                    
                        ProgressBar(progress: 50, lineWidth: 15)
                        //progress bar needs to be fixed
                        ZStack {
                            //Image("food smaller")
                            Image("lock black")
                            
                            
                        
                        
                        
                    }//2nd zstack
                    
                    Image("cat2")
                }//2nd vstack
            
            }//1st vstack
        }//zstack
            /*
             //declaration issue
            .onReceive(timer) { _ in
                vm.updateCountDown()
             
            }
             */
    }//var body
    
    struct studyView_Previews: PreviewProvider {
        static var previews: some View {
            studyView()
        }//preview
    }//studyview preview
//study view view


