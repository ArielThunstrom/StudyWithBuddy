//
//  ProgressBar.swift
//  studyCat
//
//  Created by 90309356 on 2/9/23.
//

import Foundation
import SwiftUI


struct ProgressBar : View {
    var progress : Float
    //@Binding var progress : Float
   // @Binding var timer : Float
   // var timer : Float
    var lineWidth: Int = 30
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: CGFloat(lineWidth))
                .opacity(0.3)
                .padding()
                .foregroundColor(Color.blue.opacity(0.5))
            
           // LinearGradient(gradient: Gradient(colors: colorScheme == .dark ? [Color(red: 0.77, green: 0.53, blue: 0.93), colorScheme == .dark ? Color(red: 0.77, green: 0.53, blue: 0.93): Color.black] : [Color.pink, Color.white]), startPoint: .top, endPoint: .bottom)                .mask(
            LinearGradient(gradient: Gradient(colors: [Color(.systemGray), Color(.systemPurple)]), startPoint: .top, endPoint: .bottom).mask(
            //MASK ADD COLOR TO FORGROUND OFF ALL OBJECTS IN HERE
                
                Circle()
                    
                    .trim(from: 0.0, to: CGFloat(min(progress, 1)))
            
                    .stroke(style: StrokeStyle(lineWidth: CGFloat(lineWidth), lineCap: .round, lineJoin: .round))
                    .padding()
                    .rotationEffect(Angle(degrees: 270))
                    .animation(.linear, value: progress)
            
            
            )
        }.padding() //zstack closer
    } //body view clsoer
} //progress bar view closer

struct ProgressBar_Preview: PreviewProvider {
    static var previews: some View {
        //ProgressBar(progress: Binding.constant(50), timer: Binding.constant(88), lineWidth: 20)
        ProgressBar(progress: 50, lineWidth: 15)
    } //previews view closer
} //progress bar preview closer


