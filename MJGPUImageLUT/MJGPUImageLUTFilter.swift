//
//  MJGPUImageLUTFilter.swift
//  MJGPUImageLUT
//
//  Created by Mateusz Madej on 18/12/2019.
//  Copyright © 2019 Mateusz Madej. All rights reserved.
//

import GPUImage
import CocoaLUT
import MJImageLUT

public class MJGPUImageLUTFilter: GPUImageFilterGroup {

    private let lookupImageSource: GPUImagePicture
    
    public convenience init(lut: LUT) {
        
        var lutImage: UIImage? = nil
        
        let bundle = Bundle(for: GPUImagePicture.self)
        if let image = UIImage(named: "lookup.png", in: bundle, compatibleWith: nil) {
            lutImage = lut.apply(toImage: image)
        }
        self.init(lookupImage: lutImage)
    }
    
    public init(lookupImage: UIImage?) {        
        lookupImageSource = GPUImagePicture(image: lookupImage)
        
        super.init()
        
        let lookupFilter = GPUImageLookupFilter()
        addFilter(lookupFilter)

        lookupImageSource.addTarget(lookupFilter, atTextureLocation: 1)
        lookupImageSource.processImage()

        initialFilters = [ lookupFilter ]
        terminalFilter = lookupFilter
    }
}
