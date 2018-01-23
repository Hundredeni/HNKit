//
//  HNHairlineView.swift
//  HNKit
//
//  Created by Lasse Hammer Priebe on 21/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import UIKit

@IBDesignable
open class HNHairlineView: UIView {
    
    /**
     * The hairline's color.
     *
     * Setting the value to nil results in a transparent hairline.
     * The default value is UIColor(white: 0.7, alpha: 0.5).
     */
    @IBInspectable open var hairlineColor: UIColor? = UIColor(white: 0.7, alpha: 0.5) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - UIView
    
    override open func draw(_ rect: CGRect) {
        
        // declare context
        let context = UIGraphicsGetCurrentContext()!
        
        // declare height and vertical center
        let hairlineHeight = 1 / UIScreen.main.scale
        let hairlineCenteredYCoordinate = floor(rect.origin.y + (rect.height / 2))
        
        // draw line
        let hairlinePath = UIBezierPath(rect: CGRect(x: rect.origin.x, y: hairlineCenteredYCoordinate, width: rect.width, height: hairlineHeight))
        
        context.saveGState()
        getColorOrDefault(hairlineColor).setFill()
        hairlinePath.fill()
        context.restoreGState()
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        // redraw the view when bounds change
        contentMode = .redraw
    }
    
    // MARK: - Helpers
    
    private func getColorOrDefault(_ color: UIColor?) -> UIColor {
        return color ?? .clear
    }
}

