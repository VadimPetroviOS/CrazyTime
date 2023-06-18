//
//  Constants.swift
//  Crazy time
//
//  Created by Вадим on 27.05.2023.
//

import UIKit

struct Constants {
    
    static func setSizeX(_ size: CGFloat) -> CGFloat {
        var x: CGFloat = UIScreen.main.bounds.size.width/414
        
        return size * x
    }
    
    static func setSizeY(_ size: CGFloat) -> CGFloat {
        var y: CGFloat = UIScreen.main.bounds.size.height/896
        
        return size * y
    }
    
    static func setSizeZ(_ size: CGFloat) -> CGFloat {
        var y: CGFloat = UIScreen.main.bounds.size.height/896
        if y == 1 {
            y = 10
        }
        
        
        return size * y
    }
}
