//
//  SettingTableViewController.swift
//  电工助手
//
//  Created by Bobo on 2/1/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class SettingTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Global.backgroundColor()
        self.title = "设置&反馈"
        
        let quitButton = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: "close")
        self.navigationItem.rightBarButtonItem = quitButton
        
        let settingTableView = SettingTableView(frame: self.view.bounds, style: .Grouped)
        
        settingTableView.sendMail = { (controller) -> Void in
            self.presentViewController(controller, animated: true, completion: nil)
        }
        
        settingTableView.doneWithMail = { (controller) -> Void in
            controller.dismissViewControllerAnimated(true, completion: nil)
        }
        
        self.tableView = settingTableView
    }
    
    func close() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}