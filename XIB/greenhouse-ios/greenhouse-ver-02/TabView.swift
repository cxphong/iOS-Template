//
//  TabView.swift
//  greenhouse-ver-02
//
//  Created by Cao Xuan Phong on 4/19/17.
//  Copyright © 2017 FioT. All rights reserved.
//

import UIKit

class TabView: UIView {
    @IBOutlet weak var dashboard: UIButton!
    @IBOutlet weak var reports: UIButton!
    @IBOutlet weak var more: UIButton!
    
    public func getDashboard() -> UIButton {
        return dashboard
    }
    
    public func getReports() -> UIButton {
        return reports
    }
    
    public func getMore() -> UIButton {
        return more
    }
}
