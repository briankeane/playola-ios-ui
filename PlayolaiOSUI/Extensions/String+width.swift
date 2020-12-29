//
//  String+width.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/29/20.
//

import Foundation
import UIKit

extension String {
  func width(usingFont font: UIFont) -> CGFloat {
    let fontAttributes = [NSAttributedString.Key.font: font]
    let size = self.size(withAttributes: fontAttributes)
    return size.width
  }
}
