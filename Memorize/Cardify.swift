//
//  Cardify.swift
//  Memorize
//
//  Created by Sameh Fakhouri on 10/13/21.
//

import Foundation
import SwiftUI

struct Cardify : ViewModifier {
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                content
            } else {
                RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                    .fill()
            }
        }

    }

    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10.0
        static let lineWidth: CGFloat = 3
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
