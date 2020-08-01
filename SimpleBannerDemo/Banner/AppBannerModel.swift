//
//  AppBannerModel.swift
//  test
//
//  Created by Eleanor Spenceley on 01/08/2020.
//  Copyright © 2020 Eleanor Spenceley. All rights reserved.
//

import SwiftUI

enum SystemWarningStatus {
    case notSet
    case information
    case warning
    case error
    
    func color() -> Color {
        switch self {
        case .notSet: return .gray
        case .information: return .green
        case .warning: return .orange
        case .error: return .red
        }
    }
}

class AppBannerModel: BasicBannerModel {
    
    // MARK: - Properties
    // MARK: User Configurable
    
    // Optional setting. If you want your own colors
    var bannerColors: [SystemWarningStatus: Color]? = nil

    // This will insert your own colors before the default options.
    override var backgroundColor: Color {
        
        if let bannerStatus = bannerStatus {
            if let bannerColors = bannerColors {
                return bannerColors[bannerStatus] ?? super.backgroundColor
            }
            
            return bannerStatus.color()
        }
        
        return super.backgroundColor
    }
    
    // MARK: Private
    
    private var bannerStatus: SystemWarningStatus? = nil

    
    // MARK: - Initialisation
    //
    init(bannerColors: [SystemWarningStatus: Color]? = nil) {
        self.bannerColors = bannerColors
    }
    
    // MARK: - Methods
    //
    func showSystemMessage(_ status: SystemWarningStatus, message: String) {
        
        self.bannerStatus = status
        
        self.showMessage(message)
    }
}
