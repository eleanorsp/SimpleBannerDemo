//
//  BasicBannerDemo.swift
//  SimpleBannerDemo
//
//  Created by Eleanor Spenceley on 01/08/2020.
//

import SwiftUI

// Build your list. Im using a vstack to contain areas to tap on to initiate
struct BasicBannerDemoView: View {
    
    // Pull through the model to your view and any sub views.
    @EnvironmentObject var basicBannerModel : BasicBannerModel

    let listArray = ["1", "2", "3", "4", "5"]
    var body: some View {
    
        VStack {
            ForEach(listArray, id: \.self) { row in

                HStack {
                    Spacer()

                    Text(row).padding(.all, 30)
                        .background(Color.yellow)
                        .onTapGesture(count: 1) { basicBannerModel.showMessage("Demo showing a basic banner drop down.") }

                    Spacer()
                }
            }
        }
    }
}

struct BasicBannerDemo_Previews: PreviewProvider {
    static var previews: some View {
        BasicBannerDemoView()
    }
}
