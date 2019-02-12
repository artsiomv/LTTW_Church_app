//
//  PopAnimator.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/10/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    let duration = 0.5
    var presenting = true
    var originFrame = CGRect.zero
    var dismissCompletion: (()->Void)?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        let rowView = presenting ? toView :
            transitionContext.view(forKey: .from)!
        let initialFrame = presenting ? originFrame : rowView.frame
        let finalFrame = presenting ? rowView.frame : originFrame
        
        let xScaleFactor = presenting ?
            initialFrame.width / finalFrame.width : finalFrame.width / initialFrame.width
        
        let yScaleFactor = presenting ?
            initialFrame.height / finalFrame.height : finalFrame.height / initialFrame.height
        
        let scaleTransform = CGAffineTransform(scaleX: xScaleFactor,
                                               y: yScaleFactor)
        
        if presenting {
            rowView.transform = scaleTransform
            rowView.center = CGPoint(
                x: initialFrame.midX,
                y: initialFrame.midY)
            rowView.clipsToBounds = true
        }
//        else {
//            rowView.transform = scaleTransform
//            rowView.center = CGPoint(
//                x: initialFrame.midX,
//                y: initialFrame.midY)
//            rowView.clipsToBounds = true
//        }
        
        containerView.addSubview(toView)
        containerView.bringSubviewToFront(rowView)
        
        UIView.animate(withDuration: duration, delay:0.0,
                       usingSpringWithDamping: 1, initialSpringVelocity: 0.0,
                       animations: {
                        rowView.transform = self.presenting ?
                            CGAffineTransform.identity : scaleTransform
                        rowView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
        },
                       completion: { _ in
                        if !self.presenting {
                            self.dismissCompletion?()
                        }
                        transitionContext.completeTransition(true)
        }
        )
    }
}
