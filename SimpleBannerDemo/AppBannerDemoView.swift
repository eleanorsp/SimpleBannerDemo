//
//  AppBannerDemoView.swift
//  test
//
//  Created by Eleanor Spenceley on 01/08/2020.
//  Copyright © 2020 Eleanor Spenceley. All rights reserved.
//

import SwiftUI


struct AppBannerDemoView : View {
    
    // Pull through the model to your view and any sub views.
    @EnvironmentObject var appBannerModel : AppBannerModel

    // Build your list. Im using a vstack to contain areas to tap on to initiate
    
    let listArray = ["Information", "Warning", "Error", "Not Set"]
    var body: some View {
        
        AppBannerParentView<VStack, AppBannerModel>() {
            VStack {
                ForEach(listArray, id: \.self) { row in
                    
                    HStack {
                        Spacer()
                        
                        Text(row).padding(.all, 30)
                            .background(Color.yellow)
                            .onTapGesture(count: 1) {
                                if listArray.firstIndex(of: row) == 0 {
                                    appBannerModel.showSystemMessage(SystemWarningStatus.information, message: "Information Message Here")
                                }
                                else if listArray.firstIndex(of: row) ==  1 {
                                    appBannerModel.showSystemMessage(SystemWarningStatus.warning, message: "Warning Message Here")
                                }
                                else if listArray.firstIndex(of: row) ==  2 {
                                    appBannerModel.showSystemMessage(SystemWarningStatus.error, message: "Error Message Here")
                                }
                                else {
                                    appBannerModel.showSystemMessage(SystemWarningStatus.notSet, message: "Not set?")
                                }
                            }
                        
                        Spacer()
                    }.padding(.top, 100)
                    
                }
            }
        }
    }
    
}


struct SystemBannerDemoView_Previews: PreviewProvider {
    static var previews: some View {
        AppBannerDemoView()
    }
}
