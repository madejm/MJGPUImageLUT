//
//  MJGPUImageCocoaLUTFilter.swift
//  MJGPUImageLUT
//
//  Created by Mateusz Madej on 18/12/2019.
//  Copyright © 2019 Mateusz Madej. All rights reserved.
//

import GPUImage
import CocoaLUT
import MJImageLUT

public class MJGPUImageCocoaLUTFilter: GPUImageFilterGroup {

    let lookupImageSource: GPUImagePicture
    
    public init(lut: LUT) {
        
        var lutImage: UIImage? = nil
        
        let bundle = Bundle(for: GPUImagePicture.self)
        if let image = UIImage(named: "lookup.png", in: bundle, compatibleWith: nil) {
            lutImage = lut.apply(toImage: image)
        }
        lookupImageSource = GPUImagePicture(image: lutImage)
        
        super.init()
        
        let lookupFilter = GPUImageLookupFilter()
        addFilter(lookupFilter)

        lookupImageSource.addTarget(lookupFilter, atTextureLocation: 1)
        lookupImageSource.processImage()

        initialFilters = [ lookupFilter ]
        terminalFilter = lookupFilter
    }
}
