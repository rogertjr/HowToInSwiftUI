//
//  DSSettings.swift
//  ClubhouseApp
//
//  Created by Rogério Toledo on 05/06/21.
//

import SwiftUI

class DSSettings {
    
    // MARK: - Images
    struct Images {
        /*** Image Assets ***/
        static let profile_pic = Image("profile_pic")
        
        /** SFSymbols **/
        static let search = Image(systemName: "magnifyingglass")
        static let invite = Image(systemName: "envelope.open")
        static let calendar = Image(systemName: "calendar")
        static let notificationBell = Image(systemName: "bell")
        static let home = Image(systemName: "house")
        static let grid = Image(systemName: "circle.grid.3x3.fill")
        static let person = Image(systemName: "person.fill")
        static let chatBubble = Image(systemName: "ellipsis.bubble.fill")
        static let back = Image(systemName: "chevron.backward")
        static let down = Image(systemName: "chevron.down")
        static let document = Image(systemName: "doc")
        static let gear = Image(systemName: "gear")
        static let plus = Image(systemName: "plus")
        static let handRaised = Image(systemName: "hand.raised")
        static let ellipsis = Image(systemName: "ellipsis")
        static let star = Image(systemName: "staroflife.fill")
        static let mute = Image(systemName: "speaker.slash.fill")
    }
    
    // MARK: - Colors
    struct Colors {
        static let background = Color("Background")
        static let customBlack = Color("Black")
        static let cardBackground = Color("CardBackground")
        static let cardShadowTint = Color("CardShadowTint")
        static let customGreen = Color("Green")
        static let customGrey = Color("Grey")
        static let customLightGray = Color("LightGray")
        static let customRed = Color("Red")
        static let customSecondaryBackground = Color("SecondaryBackground")
        static let textBlack = Color("TextBlack")
        static let textYellow = Color("TextYellow")
    }
}

// MARK: - Font
extension Font {
    
    struct Nunito {
        
        /// Get NunitoSans-ExtraBold with a size
        /// - Parameter size: The size of the font
        /// - Returns: A font to apply onto a view
        static func extraBold(size: CGFloat) -> Font {
            .custom("NunitoSans-ExtraBold", size: size)
        }
        
        /// Get NunitoSans-Bold with a size
        /// - Parameter size: The size of the font
        /// - Returns: A font to apply onto a view
        static func bold(size: CGFloat) -> Font {
            .custom("NunitoSans-Bold", size: size)
        }
        
        /// Get NunitoSans-SemiBold with a size
        /// - Parameter size: The size of the font
        /// - Returns: A font to apply onto a view
        static func semiBold(size: CGFloat) -> Font {
            .custom("NunitoSans-SemiBold", size: size)
        }
        
        /// Get NunitoSans-Regular with a size
        /// - Parameter size: The size of the font
        /// - Returns: A font to apply onto a view
        static func regular(size: CGFloat) -> Font {
            .custom("NunitoSans-Regular", size: size)
        }
    }
}
