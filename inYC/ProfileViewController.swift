//
//  ProfileViewController.swift
//  inYC
//
//  Created by Eldon Chan on 11/12/16.
//  Copyright © 2016 Eldon. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let scrollView = UIScrollView()
    let contentView = UIView()
    let segmentedControl = UISegmentedControl()
    let settingsTableView = UITableView()
    var settingFirstSection = [String]()
    var settingSecondSection = [String]()
    var searchBarTextField = UITextField()
    let followingTableView = UITableView()
    var followingNames = [String : [String]]()
    var followingSectionsTitles = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        settingsTableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "cell")
        generateSection()
        createLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createLayout() {
    
        view.backgroundColor = UIColor.white
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        scrollView.addSubview(contentView)
        scrollView.sizeToFit()
        contentView.snp.makeConstraints { (make) in
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(view.snp.height).multipliedBy(1.2)
            make.top.equalTo(scrollView.snp.top)
            make.bottom.equalTo(scrollView.snp.bottom)
        }
        
        contentView.addSubview(segmentedControl)
        segmentedControl.insertSegment(with: UIImage(named: "Settings"), at: 0, animated: true)
        segmentedControl.insertSegment(with: UIImage(named: "Following"), at: 1, animated: true)
        segmentedControl.addTarget(self, action: #selector(segementedControlSwitchToggled(sender:)), for: .valueChanged)
        segmentedControl.removeBorders()
        segmentedControl.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.centerX.equalTo(contentView.snp.centerX)
        }
        
        contentView.addSubview(settingsTableView)
        settingsTableView.isScrollEnabled = false
        let screenWidth = UIScreen.main.bounds.width
        let height = screenWidth * 2 / 16
        settingsTableView.rowHeight = height
        settingsTableView.snp.makeConstraints { (make) in
            make.top.equalTo(segmentedControl.snp.bottom).offset(40)
            make.height.equalTo(view.snp.height)
            make.width.equalTo(view.snp.width)
        }
        
        contentView.addSubview(searchBarTextField)
        searchBarTextField.isHidden = true
        searchBarTextField.borderStyle = UITextBorderStyle.bezel
        searchBarTextField.snp.makeConstraints { (make) in
            make.top.equalTo(segmentedControl.snp.bottom).offset(20)
            make.width.equalTo(view.snp.width).dividedBy(1.2)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        contentView.addSubview(settingsTableView)
        settingsTableView.isScrollEnabled = false
        settingsTableView.rowHeight = height
        settingsTableView.snp.makeConstraints { (make) in
            make.top.equalTo(segmentedControl.snp.bottom).offset(40)
            make.height.equalTo(view.snp.height)
        }
    }
    
    func generateSection() {
        
        settingFirstSection = ["First name", "Last name", "Email", "Address", "Change password"]
            //["First name" : "Elisa", "Last name" : "Corwin", "Email" : "elisa_corwin@guy.tv", "Address" : "4321 everlan, new york", "Change password" : "XXXXXX"]
        settingSecondSection = ["Terms + conditions", "Privacy", "Support"]
        
        followingNames = ["A" :["Andrew"],
                            "B" :["Brian"],
                            "C" :["Carol"],
                            "D" :["Daniel"],
                            "E" :["Eldon"],
                            "F" :["Francine"],
                            "G" :["George"],
                            "H" :["Henry"],
                            "I" :["Ivane"],
                            "J" :["Jackson"],
                            "K" :["Kevin"],
                            "L" :["Lorrane"],
                            "M" :["Mason"],
                            "N" :["Ned"],
                            "O" :["Odin"],
                            "P" :["Perry"],
                            "Q" :["Quinn"],
                            "R" :["Robert"],
                            "S" :["Stephanie"],
                            "T" :["Ticia"],
                            "V" :["Vincent"],
                            "W" :["Winnie"],
                            "X" :["Xin"],
                            "Y" :["Yvonne"],
                            "Z" :["Zim"]]
        
        followingSectionsTitles = Array(followingNames.keys)
        
        
        
    }
    
    func segementedControlSwitchToggled(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            settingsTableView.isHidden = false
            searchBarTextField.isHidden = true
        default:
            settingsTableView.isHidden = true
            searchBarTextField.isHidden = false
            
        }
        
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
        

            if section == 0 {
                return settingFirstSection.count
            }
                
            else if section == 1 {
                return settingSecondSection.count
            }
                
            else {
                return 0
            }

        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if tableView == settingsTableView {
            return 2
        }
        
        else {
           return followingSectionsTitles.count
        }
    }
    
    
    func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! ProfileTableViewCell
        
        var currentSection : String?
        
        if indexPath.section == 0 {
            currentSection = settingFirstSection[indexPath.row]
        }
            
        else {
            currentSection = settingSecondSection[indexPath.row]
        }
        
        cell.textCellLabel.text = currentSection
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let clearView = UIView()
        clearView.backgroundColor = UIColor.clear
        
        return clearView
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
