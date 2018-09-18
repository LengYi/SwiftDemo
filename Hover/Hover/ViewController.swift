//
//  ViewController.swift
//  Hover
//
//  Created by zj-db1140 on 2018/9/18.
//  Copyright © 2018年 zj-db1140. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var bottomImageView: UIImageView!
    
    @IBOutlet weak var viewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var hiddenConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let topImageH = self.topImageView.frame.size.height
        let offsetY = scrollView.contentOffset.y
        var centerFrame = self.middleView.frame
        
        if offsetY >= topImageH {
            self.viewTopConstraint.isActive = false
            self.viewBottomConstraint.isActive = false
            self.hiddenConstraint.isActive = true
            
            centerFrame.origin.y = 0
            self.middleView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: 44)
            self.view.addSubview(self.middleView)
        } else {
            centerFrame.origin.y = topImageH
            self.middleView.frame = centerFrame
            
            scrollView.addSubview(self.middleView)
            
            self.viewTopConstraint.isActive = true
            self.viewBottomConstraint.isActive = true
            self.hiddenConstraint.isActive = false
        }
        
//        var scale = 1 - (offsetY / 60)
//        scale = (scale >= 1) ? scale : 1
//        self.topImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
}
