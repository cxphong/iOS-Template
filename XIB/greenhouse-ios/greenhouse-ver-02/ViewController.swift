//
//  ViewController.swift
//  greenhouse-ver-02
//
//  Created by Cao Xuan Phong on 4/19/17.
//  Copyright © 2017 FioT. All rights reserved.
//

import UIKit
import ChameleonFramework

class ViewController: UIViewController {
    var tabview : TabView!
    var tabIndex = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setupTab()
    }
    
    private func setupTab() {
        self.tabview = Bundle.main.loadNibNamed("tab", owner: self, options: nil)?[0] as! TabView
        self.tabview.frame = CGRect(x:0,y:self.view.bounds.height - 62, width: self.view.bounds.size.width, height: 60)
        self.tabview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(self.tabview)
        
        self.createTabBorder()
        
        self.tabview.getDashboard().addTarget(self, action: #selector(self.clickTab(_:)), for: UIControlEvents.touchUpInside)
        self.tabview.getReports().addTarget(self, action: #selector(self.clickTab(_:)), for: UIControlEvents.touchUpInside)
        self.tabview.getMore().addTarget(self, action: #selector(self.clickTab(_:)), for: UIControlEvents.touchUpInside)
        self.updateTabHilight()
    }
    
    private func updateTabHilight() {
        if (self.tabIndex == 0) {
            self.tabview.getDashboard().setTitleColor(UIColor(hexString:"#14718b"), for: UIControlState.normal)
            self.tabview.getReports().setTitleColor(UIColor(hexString:"#ffffff"), for: UIControlState.normal)
            self.tabview.getMore().setTitleColor(UIColor(hexString:"#ffffff"), for: UIControlState.normal)
        } else if (self.tabIndex == 1) {
            self.tabview.getReports().setTitleColor(UIColor(hexString:"#14718b"), for: UIControlState.normal)
            self.tabview.getDashboard().setTitleColor(UIColor(hexString:"#ffffff"), for: UIControlState.normal)
            self.tabview.getMore().setTitleColor(UIColor(hexString:"#ffffff"), for: UIControlState.normal)
        } else if (self.tabIndex == 2) {
            self.tabview.getMore().setTitleColor(UIColor(hexString:"#14718b"), for: UIControlState.normal)
            self.tabview.getReports().setTitleColor(UIColor(hexString:"#ffffff"), for: UIControlState.normal)
            self.tabview.getDashboard().setTitleColor(UIColor(hexString:"#ffffff"), for: UIControlState.normal)
        }
    }
    
    @objc private func clickTab(_ sender: UIButton) {
        if (sender == self.tabview.getDashboard()) {
            self.tabIndex = 0
        } else if (sender == self.tabview.getReports()) {
            self.tabIndex = 1
        } else if (sender == self.tabview.getMore()) {
            self.tabIndex = 2
        }
        
          self.updateTabHilight()
    }
    
    private func createTabBorder() {
        self.addBorder(view: self.tabview.getDashboard(), edge: UIRectEdge.left, thickness: 2.0, color: UIColor.white)
        self.addBorder(view: self.tabview.getDashboard(), edge: UIRectEdge.top, thickness: 2.0, color: UIColor.white)
        self.addBorder(view: self.tabview.getDashboard(), edge: UIRectEdge.bottom, thickness: -2.0, color: UIColor.white)
        
        self.addBorder(view: self.tabview.getReports(), edge: UIRectEdge.left, thickness: 2.0, color: UIColor.white)
        self.addBorder(view: self.tabview.getReports(), edge: UIRectEdge.top, thickness: 2.0, color: UIColor.white)
        self.addBorder(view: self.tabview.getReports(), edge: UIRectEdge.bottom, thickness: -2.0, color: UIColor.white)
        
        self.addBorder(view: self.tabview.getMore(), edge: UIRectEdge.left, thickness: 2.0, color: UIColor.white)
        self.addBorder(view: self.tabview.getMore(), edge: UIRectEdge.right, thickness: 2.0, color: UIColor.white)
        self.addBorder(view: self.tabview.getMore(), edge: UIRectEdge.top, thickness: 2.0, color: UIColor.white)
        self.addBorder(view: self.tabview.getMore(), edge: UIRectEdge.bottom, thickness: -2.0, color: UIColor.white)
    }
    
    private func addBorder(view : UIView, edge : UIRectEdge, thickness : CGFloat, color : UIColor) {
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat((view.superview?.frame.width)!), height: CGFloat(thickness))
        case UIRectEdge.bottom:
            border.frame = CGRect(x: CGFloat(0), y: CGFloat((view.superview?.frame.height)! - thickness), width: CGFloat((view.superview?.frame.width)!), height: CGFloat(thickness))
        case UIRectEdge.left:
            border.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(thickness), height: CGFloat((view.superview?.frame.height)!))
        case UIRectEdge.right:
            border.frame = CGRect(x: CGFloat(view.frame.width - thickness), y: CGFloat(0), width: CGFloat(thickness), height: CGFloat((view.superview?.frame.height)!))
        default:
            break
        }
        
        border.backgroundColor = color.cgColor
        view.layer.addSublayer(border)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

