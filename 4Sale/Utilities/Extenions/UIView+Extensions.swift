//
//  UIView+Extensions.swift
//  POMacArch
//
//  Created by Shadi Elattar on 05/05/2021.
//  Copyright © 2021 POMac. All rights reserved.
//
import UIKit
import SkeletonView
import SDWebImage
import SDWebImageSVGKitPlugin

extension UIView {
    func setBorder(borderWidth: CGFloat = 1,
                   color: UIColor = UIColor.LinkMeUIColor.mainColor,
                   cornerRadius: CGFloat = 12) {
        layer.cornerRadius = cornerRadius
        layer.borderColor = color.cgColor
        layer.borderWidth = borderWidth
    }

    func roundCorners(corners: CACornerMask, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = corners
    }
    
    func roundCorners(radius: CGFloat) {
        layer.cornerRadius = radius
    }

    func startShimmering() {
//        let direction: GradientDirection = LanguageHandler.isArabic ? .rightLeft:.leftRight
//        let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: direction )
//        self.showAnimatedGradientSkeleton(animation: animation)

    }

    func stopShimmering() {
        self.stopSkeletonAnimation()
    }

    func addShadow(color: UIColor, alpha: CGFloat, xValue: CGFloat, yValue: CGFloat, blur: CGFloat) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = Float(alpha)
        self.layer.shadowOffset = CGSize(width: xValue, height: yValue)
        self.layer.shadowRadius = blur/2
    }

    func addViewWithAnimation(animationDuration: TimeInterval = 0.3) {
        self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.alpha = 0
        UIView.animate(withDuration: animationDuration, animations: {
            self.alpha = 1
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }

    func removeViewWithAnimation(animationDuration: TimeInterval = 0.3) {
        UIView.animate(withDuration: animationDuration, animations: {
            self.alpha = 0
            self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }, completion: { _ in
            self.removeFromSuperview()
        })
    }
    class func fromNib<T: UIView>() -> T {
           return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
       }
    
    // MARK: - Nib Identifier
    // Note: The Nib Assigned name must match it's class ViewModel
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
}

extension UIImageView {
    func getImage(imageUrl : String){
        guard let url = URL(string: imageUrl) else {
            self.image = UIImage(named: "360_F_120436118_eOrANXUm1ml2MoscqjcV4K5NMKEbFaGj")
            return
        }
        
        if (imageUrl as NSString).pathExtension == "svg"{
            let svgCoder = SDImageSVGKCoder.shared
            SDImageCodersManager.shared.addCoder(svgCoder)
            self.sd_setImage(with: URL(string: imageUrl))
            let svgImageSize = CGSize(width: 100, height: 100)
            self.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "uefa-europa-league"), options: [], context: [.imageThumbnailPixelSize : svgImageSize])
        }else{
            self.sd_imageIndicator = SDWebImageActivityIndicator.medium
            self.sd_setImage(with: url, placeholderImage: UIImage(named: "uefa-europa-league"))
        }
        
    }
   
}

extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

}
