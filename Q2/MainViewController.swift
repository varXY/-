//
//  MainViewController.swift
//  电工助手
//
//  Created by yao xiao on 6/26/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var tableView: UITableView!
    
    var beginnerRecords = Records(type: 0)
    var intermediateRecords = Records(type: 1)
    var advancedRecords = Records(type: 2)
    
    var sound: Bool!
    var vibration: Bool!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "电工助手"
        
        let infoButton = UIBarButtonItem(title: "设置", style: .Plain, target: self, action: #selector(infoButtonTapped))
        navigationItem.rightBarButtonItem = infoButton
        
        tableView = UITableView(frame: view.bounds, style: .Grouped)
        tableView.backgroundColor = UIColor.backgroundColor()
        tableView.frame.size.height -= 64
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    func gotoVCBaseOnIndexPath(indexPath: NSIndexPath) {
        switch indexPath.section {
        case 0:
            setSoundAndVibration()
            
            let index = indexPath.row
            let type = index == 0 ? 2 : index - 1
            let questionVC = QuestionViewController()
            questionVC.type = type
            questionVC.sound = sound
            questionVC.vibration = vibration
            
            questionVC.beginnerRecords = beginnerRecords
            questionVC.intermediateRecords = intermediateRecords
            questionVC.advancedRecords = advancedRecords
            
            questionVC.record = { [weak self] rightCount, date in
                let record = Record(record: rightCount, date: date)
                switch questionVC.type {
                case 0:
                    self!.beginnerRecords.records.insert(record, atIndex: 0)
                    questionVC.beginnerRecords = self!.beginnerRecords
                case 1:
                    self!.intermediateRecords.records.insert(record, atIndex: 0)
                    questionVC.intermediateRecords = self!.intermediateRecords
                case 2:
                    self!.advancedRecords.records.insert(record, atIndex: 0)
                    questionVC.advancedRecords = self!.advancedRecords
                default:
                    break
                }
                
            }
            
            questionVC.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(questionVC, animated: true)
            
        case 1:
            let equationVC = EquationViewController()
            equationVC.index = indexPath.row
            equationVC.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(equationVC, animated: true)
            
        case 2:
            let contentVC = ContentViewController()
            contentVC.index = indexPath.row
            contentVC.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(contentVC, animated: true)
            
        default:
            break
            
        }
    }
    
    func setSoundAndVibration() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let sound = defaults.valueForKey(SettingDefault.sound) as? Bool {
            self.sound = sound
        } else {
            self.sound = true
            defaults.setBool(true, forKey: SettingDefault.sound)
        }
        
        if let vibration = defaults.valueForKey(SettingDefault.vibration) as? Bool {
            self.vibration = vibration
        } else {
            self.vibration = true
            defaults.setBool(true, forKey: SettingDefault.vibration)
        }
        
        defaults.synchronize()
    }
    
    func infoButtonTapped() {
        let settingVC = SettingTableViewController()
        let settingNavi = NavigationController(rootViewController: settingVC)
        presentViewController(settingNavi, animated: true, completion: nil)
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 2:
            return 3
        case 1:
            return 4
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ["答题练习", "计算工具", "常用知识"][section]
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        cell.accessoryType = .DisclosureIndicator
        cell.imageView?.image = UIImage(named: "电工试题")
        cell.imageView?.tintColor = UIColor.themeRed()
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = ["初级试题", "中级试题", "高级试题"][indexPath.row]
        case 1:
            cell.textLabel?.text = ["欧姆定律", "功率", "电量", "电阻"][indexPath.row]
        case 2:
            cell.textLabel?.text = ["单位公式", "图标符号", "工具设备"][indexPath.row]
        default:
            break
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        gotoVCBaseOnIndexPath(indexPath)
    }
}






