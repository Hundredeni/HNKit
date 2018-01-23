//
//  HNCardView.swift
//  HNKit
//
//  Created by Lasse Hammer Priebe on 21/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import UIKit

@IBDesignable
open class HNCardView: UIView {
    
    /**
     * The card's color.
     *
     * This is effectively the background color of the view.
     * Setting the value to nil results in a transparent card.
     * The default value is UIColor.white.
     */
    @IBInspectable open var cardColor: UIColor? = UIColor.white {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /**
     * The card's corner radius.
     *
     * The default value is 12.
     */
    @IBInspectable open var cardCornerRadius: CGFloat = 12 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /**
     * The color of the shadow cast by the card.
     *
     * Setting the value to nil results in a transparent shadow.
     * The default value is UIColor(white: 0.7, alpha: 0.5).
     */
    @IBInspectable open var shadowColor: UIColor? = UIColor(white: 0.7, alpha: 0.5) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /**
     * The radius of the blur of the shadow cast by the card.
     *
     * Increasing the value increases the size and feathering
     * of the shadow. The default value is 6.
     */
    @IBInspectable open var shadowBlurRadius: CGFloat = 6 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /**
     * The horizontal offset of the shadow cast by the card.
     *
     * Increasing the value shifts the shadow from left
     * to right. The default value is 0.
     */
    @IBInspectable open var shadowHorizontalOffset: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /**
     * The vertical offset of the shadow cast by the card.
     *
     * Increasing the value shifts the shadow downwards.
     * The default value is 2.
     */
    @IBInspectable open var shadowVerticalOffset: CGFloat = 2 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - UIView
    
    override open func draw(_ rect: CGRect) {

        // declare context
        let context = UIGraphicsGetCurrentContext()!
        
        // declare shadow
        let shadow = NSShadow()
        shadow.shadowColor = shadowColor
        shadow.shadowOffset = CGSize(width: shadowHorizontalOffset, height: shadowVerticalOffset)
        shadow.shadowBlurRadius = shadowBlurRadius
        
        // draw container
        let containerPath = UIBezierPath(roundedRect: CGRect(x: rect.origin.x + shadowBlurRadius - shadowHorizontalOffset,
                                                             y: rect.origin.y + shadowBlurRadius - shadowVerticalOffset,
                                                             width: rect.size.width - (2 * shadowBlurRadius),
                                                             height: rect.size.height - (2 * shadowBlurRadius)),
                                         cornerRadius: cardCornerRadius)
        
        context.saveGState()
        context.setShadow(offset: shadow.shadowOffset, blur: shadow.shadowBlurRadius, color: (shadow.shadowColor as! UIColor).cgColor)
        getColorOrDefault(cardColor).setFill()
        containerPath.fill()
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
