//
//  LinearGradient+blackOpacityGradient.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/27/20.
//

import Foundation
import SwiftUI

extension LinearGradient {
  static let blackOpacityGradient = LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.95)]),
                                                   startPoint: .top,
                                                   endPoint: .bottom
                                    )
}
