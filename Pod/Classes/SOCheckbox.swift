//
//  SOCheckbox.swift
//  Pods
//
//  Created by Sebastian Osiński on 21.10.2015.
//
//

import UIKit

public enum SOCheckboxStyle {
    case fill
    case tick
}

@IBDesignable open class SOCheckbox: UIControl {
    
    @IBInspectable open var checkedColor: UIColor = UIColor.black
    @IBInspectable open var borderColor: UIColor = UIColor.black
    @IBInspectable open var checked: Bool = true {
        didSet {
            setNeedsDisplay()
        }
    }
    
    open var style: SOCheckboxStyle = .tick {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SOCheckbox.changeValue)))
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SOCheckbox.changeValue)))
    }
    
    func changeValue() {
        checked = !checked
        sendActions(for: .valueChanged)
    }
    
    fileprivate var borderOrigin: CGPoint {
        let x: CGFloat = bounds.size.width * 0.05
        let y: CGFloat = bounds.size.height * 0.05
        
        return CGPoint(x: x, y: y)
    }
    
    fileprivate var borderSize: CGSize {
        let width: CGFloat = bounds.size.width * 0.9
        let height: CGFloat = bounds.size.height * 0.9
        
        return CGSize(width: width, height: height)
    }
    
    fileprivate var borderRect: CGRect {
        return CGRect(origin: borderOrigin, size: borderSize)
    }
    
    fileprivate var bezierPathForTick: UIBezierPath {
        let path = UIBezierPath()
        
        return path
    }
    
    fileprivate func drawFilled() {
        let size = CGSize(width: bounds.size.width * 0.6, height: bounds.size.height *  0.6)
        let origin = CGPoint(x: bounds.size.width * 0.2, y: bounds.size.height * 0.2)
        let rect = CGRect(origin: origin, size: size)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 4)
        checkedColor.set()
        path.fill()
        path.stroke()
    }
    
    fileprivate func drawTick() {
        let size = bounds.size
        
        let beginning = CGPoint(x: size.width * 0.2, y: size.height * 0.5)
        let bottom = CGPoint(x: size.width * 0.5, y: size.height * 0.7)
        let end = CGPoint(x: size.width * 0.8, y: size.height * 0.2)
        let middle = CGPoint(x: size.width * 0.6, y: size.height * 0.4)
        
        let path = UIBezierPath()
        path.move(to: beginning)
        path.addLine(to: bottom)
        path.addCurve(to: end, controlPoint1: bottom, controlPoint2: middle)
        
        checkedColor.set()
        path.lineWidth = 4
        path.stroke()
        }
    
    override open func draw(_ rect: CGRect) {
        let borderPath = UIBezierPath(roundedRect: borderRect, cornerRadius: 6)
        borderPath.lineWidth = 2
        borderColor.set()
        borderPath.stroke()
        UIColor.clear.setFill()
        borderPath.fill()
        if checked {
            switch style {
            case .fill: drawFilled()
            case .tick: drawTick()
            }
        }
    }
    
}
