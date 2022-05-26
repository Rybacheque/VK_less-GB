//
//  CustomPushAnimator.swift
//  VK_less
//
//  Created by Сергей Рыбачек on 04.05.2022.
//

import UIKit

final class CustomPushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        destination.view.frame = source.view.frame
        
        let ratio = (source.view.bounds.height - source.view.bounds.width) / 2
        let firstT = CGAffineTransform(translationX: -ratio, y: -source.view.frame.height + ((source.view.frame.height - source.view.frame.width) / 2))
        let secondT = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        destination.view.transform = secondT.concatenating(firstT)
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext), delay: 0, options: .calculationModePaced, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4, animations: {
                destination.view.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
            })
        }) { finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.view.transform = .identity }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
    
}
