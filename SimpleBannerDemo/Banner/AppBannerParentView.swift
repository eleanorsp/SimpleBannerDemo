//
//  AppBannerParentView.swift
//  test
//
//  Created by Eleanor Spenceley on 01/08/2020.
//  Copyright © 2020 Eleanor Spenceley. All rights reserved.
//

import SwiftUI

typealias AppBannerClosureType = (_ screenwidth: CGFloat, _ height: CGFloat,
                                  _ backgroundColor: Color, _ forgroundColor: Color, _ opacity: Double) -> AnyView


struct AppBannerParentView<Content, BannerModel>: View where Content: View,
                                                             BannerModel : GenericBannerModel {
        
    // MARK: - Properties
    // MARK: Setup View Attributes
    @EnvironmentObject var appBannerModel: BannerModel

    var content: () -> Content
    var banner: AppBannerClosureType? = nil // Will use default banner if not set.
    
    var bannerFont: Font {
        if UIView().traitCollection.horizontalSizeClass == .compact {
            return Font.caption
        }
        else {
            return Font.body
        }
    }
    
    // MARK: - Initialisation
    
    init(banner: AppBannerClosureType? = nil, content: @escaping () -> Content) {
        self.banner = banner
        self.content = content
    }

    // MARK: - View Body
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                
                self.content()
                
                if let banner = banner {
                    banner(geometry.size.width,
                           appBannerModel.height,
                           appBannerModel.backgroundColor,
                           appBannerModel.foregroundColor,
                           appBannerModel.opacity)
                }
                else {
                    self.defaultBanner(screenWidth: geometry.size.width)
                }
            }
        }
    }
    
    func defaultBanner(screenWidth: CGFloat) -> some View {
        return HStack {
            Spacer()
            Text(appBannerModel.message)
                .font(self.bannerFont)
                .padding(.horizontal, 20)
                .opacity(appBannerModel.isTextShowing == true ? 1.0 : 0.0)
                .minimumScaleFactor(0.8)
                .transition(.moveAndFade)
            
            Spacer()
        }
        .frame(width: screenWidth,
               height: appBannerModel.height)
        .background(appBannerModel.backgroundColor)
        .opacity(appBannerModel.opacity)
        .foregroundColor(appBannerModel.foregroundColor)
    }
}
    
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        AnyTransition.slide
    }
}

// No preview since this is very transient.

