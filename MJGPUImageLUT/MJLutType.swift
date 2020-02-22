//
//  MJLutType.swift
//  MJGPUImageLUT
//
//  Created by Mateusz Madej on 26/12/2019.
//  Copyright © 2019 Mateusz Madej. All rights reserved.
//

import UIKit
import CocoaLUT

public enum MJLutType {
    case cube(LUT)
    case image(UIImage)
}

extension MJLutType: Equatable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case (let cube(lhsLUT), let cube(rhsLUT)):
            return lhsLUT == rhsLUT
        case (let image(lhsImage), let image(rhsImage)):
            return lhsImage == rhsImage
        default:
            return false
        }
    }
}
