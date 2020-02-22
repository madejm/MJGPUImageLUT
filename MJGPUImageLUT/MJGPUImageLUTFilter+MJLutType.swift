//
//  MJGPUImageLUTFilter+MJLutType.swift
//  MJGPUImageLUT
//
//  Created by Mateusz Madej on 21/12/2019.
//  Copyright © 2019 Mateusz Madej. All rights reserved.
//

import Foundation

public extension MJGPUImageLUTFilter {
    
    convenience init(lutType: MJLutType) {
        switch lutType {
        case .cube(let lut):
            self.init(lut: lut)
        case .image(let image):
            self.init(lookupImage: image)
        }
    }
}
