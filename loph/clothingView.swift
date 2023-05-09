//
//  clothingView.swift
//  loph
//
//  Created by 90309356 on 4/11/23.
//

import SwiftUI

let green = Color(red: 0.808, green: 0.847, blue: 0.78)


struct clothingView: View {

    
    @ObservedObject var birds = clothingItem()
    @State private var showingAlert = false
    //this is basically min
    @EnvironmentObject var min : testing
 
        var body: some View {
        NavigationView {
            ZStack{
                green
                    .ignoresSafeArea()
                //put a background image here
                ScrollView {
                    Text("Pick Your Study Buddy!")
                        .font(.system(.title2, design: .monospaced))
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 3){
                        ForEach(birds.types, id: \.self) { item in
                            VStack {
                                
                                Button(action: {
                                    min.imageString = item.image
                                    showingAlert = true
                                }) {
                                 Image(item.image)
                                 //Text(item.category)
                                 
                                 }.alert(isPresented: $showingAlert) {
                                     Alert( title: Text("Success!"),
                                            message: Text("Click the back arrow to return to the home page")
                                 )
                                 }
                                 
                                
                                 
                        
                            }
                        }
                        
                    }.coordinateSpace(name: "scroll")
                    
                }.environmentObject(testing())
            }
        }
    }
    
}



struct clothingView_Previews: PreviewProvider {
    static var previews: some View {
        clothingView()
            .environmentObject(testing())
            
        
    }
}
