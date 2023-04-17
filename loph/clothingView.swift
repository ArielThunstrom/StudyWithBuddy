//
//  clothingView.swift
//  loph
//
//  Created by 90309356 on 4/11/23.
//

import SwiftUI

let green = Color(red: 0.808, green: 0.847, blue: 0.78)



//@Binding var picString: String

struct clothingView: View {

    @Binding var pictureString : String
    @ObservedObject var birds = clothingItem()
    
 
    var body: some View {
        ZStack{
            green
                .ignoresSafeArea()
            //put a background image here
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 6){
                    //ForEach(data, id: \.self) { item in
                     // Text(item)
                    ForEach(birds.types, id: \.self) { item in
                        VStack {
                            Button(item.category){
                                //change the pic of the bird here
                                pictureString = item.image
                            }
                            Image(item.image)
                            
                        }
                        
                       
                    }
                }
            }.coordinateSpace(name: "scroll")
                /*
                .safeAreaInsert(edge: .top, content: {
                    Color.clear
                        .frame(height: 3)//idk what the hieght should be
                })
                 */
        }
    }
    
}

struct clothingView_Previews: PreviewProvider {
    static var previews: some View {
        clothingView(pictureString : Binding.constant("white bird"))
       // clothingView().environmentObject(clothingItem)
    }
}
