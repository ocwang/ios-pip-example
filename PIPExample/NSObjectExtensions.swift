//
//  UIViewControllerExtensions.swift
//  PIPExample
//
//  Created by Chase Wang on 8/17/16.
//  Copyright © 2016 ocwang. All rights reserved.
//

import UIKit

extension NSObject {
    class func toString() -> String {
        let name = NSStringFromClass(self)
        let components = name.components(separatedBy: ".")
        
        guard let classString = components.last
            else { fatalError("Error: couldn't convert class name to string.") }
        
        return classString
    }
    
    class func pip_nibNamed(nibName: String) -> UINib {
        return UINib(nibName: nibName, bundle: Bundle.main)
    }
    
    class func pip_nib() -> UINib {
        return pip_nibNamed(nibName: self.toString())
    }
    
    class func pip_instantiateWithNibNamed<T>(nibName: String) -> T {
        let nib = pip_nibNamed(nibName: nibName)
        let objects = nib.instantiate(withOwner: nil, options: nil)
        
        guard let object = objects.first else {
            fatalError("Error: couldn't create nib named \(nibName)")
        }
        
        return object as! T
    }
    
    class func pip_instantiateFromNib<T>() -> T {
        return pip_instantiateWithNibNamed(nibName: self.toString())
    }
}
