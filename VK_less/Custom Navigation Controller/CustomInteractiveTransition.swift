//
//  CustomInteractiveTransition.swift
//  VK_less
//
//  Created by Сергей Рыбачек on 04.05.2022.
//

import UIKit

class CustomInteractiveTransition: UIPercentDrivenInteractiveTransition {
    var viewController: UIViewController? {
        didSet {
            let recognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleSreenEdgeGesture(_:)))
            recognizer.edges = [.left]
            viewController?.view.addGestureRecognizer(recognizer)
        }
    }
    
    var hasStarted: Bool = false
    var shouldFinished: Bool = false
    
    @objc func handleSreenEdgeGesture(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            self.hasStarted = true
            self.viewController?.navigationController?.popViewController(animated: true)
            
        case .changed:
            let translation = recognizer.translation(in: recognizer.view)
            let relativeTranslation = abs(translation.y) / (recognizer.view?.bounds.width ?? 1)
            let progress = max(0, min(1, relativeTranslation))
            self.shouldFinished = progress > 0.33
            self.update(progress)
            
        case .ended:
            self.hasStarted = false
            self.shouldFinished ? self.finish() : self.cancel()
            
        case .cancelled:
            self.hasStarted = false
            self.cancel()
            
        default: return
        }
    }
}

