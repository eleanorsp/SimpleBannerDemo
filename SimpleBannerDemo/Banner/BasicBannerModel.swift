//
//  BasicBannerModel.swift
//  test
//
//  Created by Eleanor Spenceley on 01/08/2020.
//  Copyright © 2020 Eleanor Spenceley. All rights reserved.
//

import SwiftUI
    
protocol GenericBannerModel : ObservableObject {
    var bannerHeight: CGFloat { get set }
    var foregroundColor: Color { get set }
    var showDelay: Double { get set }
    var opacity: Double { get set }
    
    var backgroundColor: Color { get }
    var height: CGFloat { get }
    
    // Need to be Published in Model
    var isShowing: Bool { get }
    var isTextShowing: Bool { get }
    var dropdownOffset: CGPoint { get }
    var message: String { get }
}

class BasicBannerModel : GenericBannerModel {
    
    // MARK: - Properties
    // MARK: User Configurable
    var bannerHeight: CGFloat = 60
    var foregroundColor: Color = Color.primary
    var showDelay: Double = 5
    var opacity: Double = 1.0

    // Override this to add your own background color options.
    var backgroundColor: Color {
        return _backgroundColor
    }
    
    var height: CGFloat {
        self.isShowing ? bannerHeight : 0
    }

    // MARK: Private
    private var _backgroundColor: Color = Color.red

    // MARK: View control.
    @Published private(set) var isShowing: Bool = false
    @Published private(set) var isTextShowing: Bool = false
    @Published private(set) var dropdownOffset: CGPoint
    @Published private(set) var message: String = ""

    // MARK: - Initialisation
    //
    init() {
        self.dropdownOffset = CGPoint(x: 0, y: (self.bannerHeight/2.0))
    }
    
    // MARK: Convenience Init
    convenience init(bannerHeight: CGFloat = 50,
                     foregroundColor: Color = Color.primary,
                     backgroundColor: Color = Color.red,
                     showDelay: Double = 5,
                     opacity: Double = 1.0) {
        
        self.init()

        self.bannerHeight = bannerHeight
        self.foregroundColor = foregroundColor
        self._backgroundColor = backgroundColor
        self.showDelay = showDelay
        self.opacity = opacity
        
        self.dropdownOffset = CGPoint(x: 0, y: (self.bannerHeight/2.0))
    }
    
    // MARK: - Methods
    
    func showMessage(_ message: String) {
        
        self.message = message
        self.toggleDropdown()
    }
    
    final func setBackgroundColor(_ color: Color) {
        self._backgroundColor = color
    }

    // MARK: - Private Methods

    private func toggleDropdown() {
        DispatchQueue.main.async() {
            withAnimation {
                self.isShowing = true
                self.isTextShowing = true
                self.dropdownOffset = CGPoint(x: 0, y: 0)
            }
            
            // This makes the text disappear in a nicer way.
            DispatchQueue.main.asyncAfter(deadline: .now() + self.showDelay) {
                self.isTextShowing = false
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + self.showDelay) {
                withAnimation {

                    self.isShowing = false
                    self.dropdownOffset = CGPoint(x: 0, y: self.bannerHeight)
                }
            }
        }
    }
}
    
